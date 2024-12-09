extends Node3D

@export var structures: Array[Structure] = []

var map:DataMap

@export var selector:Node3D # The 'cursor'
@export var selector_container:Node3D # Node that holds a preview of the structure
@export var view_camera:Camera3D # Used for raycasting mouse
@export var gridmap:GridMap
@export var cash_display:Label

var plane:Plane # Used for raycasting mouse

func _ready():
	# Try to load the saved map; fallback to the premade map if no saved map is found
	map = ResourceLoader.load("res://maps/saved_map.res")
	if not map:
		map = ResourceLoader.load("res://maps/premade_map.res")
	if not map:
		map = DataMap.new()  # Create an empty map if both loading attempts fail

	plane = Plane(Vector3.UP, Vector3.ZERO)

	# Create new MeshLibrary dynamically, can also be done in the editor
	var mesh_library = MeshLibrary.new()

	for structure in structures:
		var id = mesh_library.get_last_unused_item_id()

		mesh_library.create_item(id)
		mesh_library.set_item_mesh(id, get_mesh(structure.model))
		mesh_library.set_item_mesh_transform(id, Transform3D())

	# Assign the newly created MeshLibrary to the GridMap
	gridmap.mesh_library = mesh_library

	# Load the structures from the map into the GridMap
	for cell in map.structures:
		gridmap.set_cell_item(Vector3i(cell.position.x, 0, cell.position.y), cell.structure, cell.orientation)

	update_cash()

@onready var info_panel = get_node("/root/Main/CanvasLayer/Control/Panel")
var last_clicked_position: Vector3i = Vector3i(-1, -1, -1)

func _process(delta):
	# Controls
	action_rotate() # Rotates selection 90 degrees

	action_save() # Saving
	action_load() # Loading

	if Input.is_action_just_pressed("reset"):
		print("Reset button pressed!")  # Debug print to confirm input detection
		action_reset()

	# Map position based on mouse
	var world_position = plane.intersects_ray(
		view_camera.project_ray_origin(get_viewport().get_mouse_position()),
		view_camera.project_ray_normal(get_viewport().get_mouse_position())
	)

	if world_position != null:
		var grid_x = round(world_position.x)
		var grid_z = round(world_position.z)
		var gridmap_position = Vector3i(grid_x, 0, grid_z)
		selector.position = lerp(selector.position, Vector3(grid_x, 0, grid_z), delta * 40)

	# Raycast to check for building/environment selection based on mouse input
	if Input.is_action_just_pressed("click"):
		print("Click detected")  # Debug print to confirm input detection
		if world_position != null:
			var clicked_position = Vector3i(round(world_position.x), 0, round(world_position.z))
			print("Clicked GridMap position: ", clicked_position)  # Debug print to confirm gridmap position

			var cell_item = gridmap.get_cell_item(clicked_position)
			if cell_item != -1 and cell_item < structures.size():
				var structure = structures[cell_item]

				# Check if the same building was clicked twice
				if last_clicked_position == clicked_position:
					info_panel.visible = false
					last_clicked_position = Vector3i(-1, -1, -1)  # Reset to default value
					print("Same building clicked, closing panel.")
					return

				if structure.type == "building":
					if info_panel:
						info_panel.update_info_panel(structure)
						info_panel.visible = true
						last_clicked_position = clicked_position
					print("Building clicked: ", structure.name)
				elif structure.type == "environment":
					if info_panel:
						info_panel.visible = false  # Hide the panel if an environment is clicked
					print("Environment clicked: ", structure.name)
				else:
					if info_panel:
						info_panel.visible = false
					print("Unknown structure type clicked: ", structure.name)
			else:
				if info_panel:
					info_panel.visible = false
				last_clicked_position = Vector3i(-1, -1, -1)  # Reset to default value
				print("No structure found at clicked position.")


# Retrieve the mesh from a PackedScene, used for dynamically creating a MeshLibrary
func get_mesh(packed_scene: PackedScene) -> Mesh:
	var scene_state: SceneState = packed_scene.get_state()
	for i in range(scene_state.get_node_count()):
		if scene_state.get_node_type(i) == "MeshInstance3D":
			for j in range(scene_state.get_node_property_count(i)):  # Fix: Add `range` here
				var prop_name = scene_state.get_node_property_name(i, j)
				if prop_name == "mesh":
					var prop_value = scene_state.get_node_property_value(i, j)
					return prop_value.duplicate()  # Return the duplicated Mesh instance
	return null  # Return null if no mesh is found

# Rotates the 'cursor' 90 degrees
func action_rotate():
	if Input.is_action_just_pressed("rotate"):
		selector.rotate_y(deg_to_rad(90))

func update_cash():
	cash_display.text = "$" + str(map.cash)

# Saving/load
func action_save():
	if Input.is_action_just_pressed("save"):
		print("Saving current game state...")

		map.structures.clear()
		for cell in gridmap.get_used_cells():
			var data_structure:DataStructure = DataStructure.new()
			data_structure.position = Vector2i(cell.x, cell.z)
			data_structure.orientation = gridmap.get_cell_item_orientation(cell)
			data_structure.structure = gridmap.get_cell_item(cell)
			map.structures.append(data_structure)

		ResourceSaver.save(map, "res://maps/saved_map.res")  # Save to the user's directory to persist progress

func action_load():
	if Input.is_action_just_pressed("load"):
		print("Loading map...")

		gridmap.clear()

		map = ResourceLoader.load("res://maps/saved_map.res")
		if not map:
			map = DataMap.new()
		for cell in map.structures:
			gridmap.set_cell_item(Vector3i(cell.position.x, 0, cell.position.y), cell.structure, cell.orientation)

		update_cash()
		print("Loaded map cash: ", map.cash)

func action_reset():
	if Input.is_action_just_pressed("reset"):
		print("Resetting to premade map...")

		# Delete the saved map file if it exists
		var dir_access = DirAccess.open("res://")
		if dir_access and dir_access.file_exists("res://maps/saved_map.res"):
			var delete_error = dir_access.remove("res://maps/saved_map.res")
			if delete_error == OK:
				print("Saved map file deleted successfully.")
			else:
				print("Failed to delete saved map file. Error code: ", delete_error)

		# Load the premade map
		var premade_map = ResourceLoader.load("res://maps/premade_map.res")
		if not premade_map:
			print("Failed to load premade map. Creating a new empty map.")
			premade_map = DataMap.new()

		# Clear the gridmap completely
		gridmap.clear()

		# Reload the MeshLibrary to avoid any residual data issues
		var mesh_library = MeshLibrary.new()
		for structure in structures:
			var id = mesh_library.get_last_unused_item_id()
			mesh_library.create_item(id)
			mesh_library.set_item_mesh(id, get_mesh(structure.model))
			mesh_library.set_item_mesh_transform(id, Transform3D())
		gridmap.mesh_library = mesh_library

		# Load the structures from the premade map into the gridmap
		for cell in premade_map.structures:
			gridmap.set_cell_item(Vector3i(cell.position.x, 0, cell.position.y), cell.structure, cell.orientation)

		# Update the current map instance to reflect the premade map state
		map = premade_map

		# Reset the cash to the initial value of 10,000
		map.cash = 10000

		# Update the cash display based on the reset premade map's cash value
		update_cash()
		print("Reset completed. Cash: ", map.cash)
