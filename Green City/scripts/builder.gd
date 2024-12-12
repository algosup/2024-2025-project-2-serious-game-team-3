extends Node3D

@export var structures: Array[Structure] = []

var map: DataMap

@export var selector: Node3D # The 'cursor'
@export var selector_container: Node3D # Node that holds a preview of the structure
@export var view_camera: Camera3D # Used for raycasting mouse
@export var gridmap: GridMap
@export var interval_time: float = 1.0
@export var pollution_gauge: ProgressBar
@export var cash_display: Label
@export var pollution_label: Label
@export var time_label: Label

var res_timer: Timer
var game_timer: Timer
var income_timer: Timer
var plane: Plane # Used for raycasting mouse
var is_gameplay_enabled: bool = true # Flag to enable or disable gameplay

@onready var info_panel = get_node("/root/Main/CanvasLayer/Control/Panel")
var last_clicked_position: Vector3i = Vector3i(-1, -1, -1)

func _ready():
	# Try to load the saved map; fallback to the premade map if no saved map is found
	map = ResourceLoader.load("res://maps/saved_map.res")
	if not map:
		map = ResourceLoader.load("res://maps/premade_map.res")
	if not map:
		map = DataMap.new()  # Create an empty map if both loading attempts fail

	plane = Plane(Vector3.UP, Vector3.ZERO)

	# Initialize the resource timer (pollution updates)
	res_timer = Timer.new()
	res_timer.wait_time = interval_time
	res_timer.one_shot = false
	res_timer.connect("timeout", Callable(self, "_on_res_timer_timeout"))
	add_child(res_timer)
	res_timer.start()

	# Initialize the game timer (10 minutes duration)
	game_timer = Timer.new()
	game_timer.wait_time = 600.0  # 10 minutes = 600 seconds
	game_timer.one_shot = true
	game_timer.connect("timeout", Callable(self, "_on_game_timer_timeout"))
	add_child(game_timer)
	game_timer.start()
	
	
	# Add a central income timer
	var income_timer = Timer.new()
	income_timer.wait_time = interval_time
	income_timer.one_shot = false
	income_timer.connect("timeout", Callable(self, "simulate_income"))
	add_child(income_timer)
	income_timer.start()


	# Debug output
	print(get_node_or_null("CanvasLayer/Control/PollutionGauge"))
	print("Cash Display Node: ", cash_display)
	print("Pollution Label Node: ", pollution_label)

	# Create new MeshLibrary dynamically
	var mesh_library = MeshLibrary.new()
	for structure in structures:
		var id = mesh_library.get_last_unused_item_id()
		mesh_library.create_item(id)
		mesh_library.set_item_mesh(id, get_mesh(structure.model))
		mesh_library.set_item_mesh_transform(id, Transform3D())
	gridmap.mesh_library = mesh_library
	
	# Load the structures from the map into the GridMap
	for cell in map.structures:
		gridmap.set_cell_item(Vector3i(cell.position.x, 0, cell.position.y), cell.structure, cell.orientation)

	update_resources()

func _process(delta):
	# Allow timers and updates to continue even if gameplay is disabled
	handle_panel_logic()

	# Update the time label with the remaining time
	if is_instance_valid(game_timer):
		var remaining_time = game_timer.time_left
		var minutes = int(remaining_time) / 60
		var seconds = int(remaining_time) % 60
		time_label.text = "Time Left: %02d:%02d" % [minutes, seconds]

	# Skip gameplay logic if disabled
	if not is_gameplay_enabled:
		return

	# Gameplay-related logic (e.g., selector, gridmap interactions)
	process_gameplay_inputs(delta)

func process_gameplay_inputs(delta):
	# Existing gameplay input logic for raycasting and interactions
	var world_position = plane.intersects_ray(
		view_camera.project_ray_origin(get_viewport().get_mouse_position()),
		view_camera.project_ray_normal(get_viewport().get_mouse_position())
	)

	if world_position != null:
		var grid_x = round(world_position.x)
		var grid_z = round(world_position.z)
		selector.position = lerp(selector.position, Vector3(grid_x, 0, grid_z), delta * 40)

	if Input.is_action_just_pressed("click"):
		handle_click(world_position)

func handle_click(world_position):
	# Logic to handle clicks and open the info panel
	var clicked_position = Vector3i(round(world_position.x), 0, round(world_position.z))
	var cell_item = gridmap.get_cell_item(clicked_position)
	if cell_item != -1 and cell_item < structures.size():
		var structure = structures[cell_item]

		if structure.type == "building":
			if info_panel:
				info_panel.update_info_panel(structure, cell_item)
				info_panel.visible = true
				toggle_gameplay(false)
	else:
		close_info_panel()
		
	reactivate_gameplay_on_panel_close()
	update_cash_display()
	


func get_map() -> DataMap:
	return map
	
	
func toggle_gameplay(state: bool):
	is_gameplay_enabled = state
	selector.visible = state
	gridmap.set_process(state)
	print("Gameplay toggled:", state)

func close_info_panel():
	if info_panel:
		info_panel.visible = false
	toggle_gameplay(true)

func handle_panel_logic():
	if info_panel.visible:
		gridmap.set_process(false)
		selector.set_process(false)
	else:
		gridmap.set_process(true)
		selector.set_process(true)


# Function to disable gameplay (optional)
func disable_gameplay():
	# Disable input or any other gameplay elements
	selector.set_process(false)  # Disable cursor movement
	gridmap.set_process(false)   # Stop GridMap interactions
	res_timer.stop()             # Stop pollution updates
	print("Gameplay disabled.")


func reactivate_gameplay_on_panel_close():
	is_gameplay_enabled = true
	selector.visible = true
	selector.set_process(true)
	gridmap.set_process(true)
	print("Gameplay re-enabled after panel close.")



# Function to handle resource timer updates
func _on_res_timer_timeout():
	for building in structures:
		apply_building_pollution_effect(building)



# Function to handle game timer timeout
func _on_game_timer_timeout():
	print("Game Over: Time is up!")

	# Check pollution level
	if map.pollution < pollution_gauge.max_value:
		print("Victory! Pollution is under control.")
		# Load WinningScene
		var winning_scene = load("res://scenes/win.tscn").instantiate()
		# Pass map to the winning scene
		if winning_scene.has_method("set_game_data"):
			winning_scene.set_game_data(map)
		else:
			print("Error: Winning scene does not have set_game_data method.")

		# Add the new scene to the tree
		get_tree().root.add_child(winning_scene)

		# Optional: Remove the current scene
		get_tree().current_scene.queue_free()
	else:
		print("Defeat! Pollution reached maximum levels.")
		# Change directly to the lose scene
		get_tree().change_scene_to_file("res://scenes/lose.tscn")  # Update path if needed



# Check pollution level and redirect if it exceeds the max
func check_pollution_level():
	if map.pollution >= pollution_gauge.max_value:
		print("Pollution has reached the maximum level! Game Over.")
		redirect_to_lose_scene()



# Redirect to losing screen
func redirect_to_lose_scene():
	get_tree().change_scene_to_file("res://scenes/lose.tscn")





@onready var data_map = get_node("data_map.gd")


func apply_building_pollution_effect(building: Structure):
	if not pollution_gauge:
		print("Error: pollution_gauge is null!")
		return
	if not map:
		print("Error: map is null!")
		return

	map.pollution += building.pollution_effect
	map.pollution = clamp(map.pollution, 0, pollution_gauge.max_value)
	update_resources()



func _on_pollution_timer_timeout():
	for building in structures:
		apply_building_pollution_effect(building)
		


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




# Update the resources and gauge based on the current pollution level
func update_resources():
	if not is_instance_valid(cash_display):
		print("Error: cash_display is null!")
		return
	if not is_instance_valid(pollution_label):
		print("Error: pollution_label is null!")
		return
	if not is_instance_valid(pollution_gauge):
		print("Error: pollution_gauge is null!")
		return

	# Update cash display
	cash_display.text = "$" + str(map.cash)

	# Update pollution label and gauge
	pollution_label.text = "Pollution: " + str(map.pollution)
	pollution_gauge.value = map.pollution

	# Adjust ProgressBar fill color
	var sb = StyleBoxFlat.new()
	pollution_gauge.add_theme_stylebox_override("fill", sb)

	if map.pollution < pollution_gauge.max_value / 3:
		sb.bg_color = Color(0, 1, 0)  # Green for low pollution
	elif map.pollution < (2 * pollution_gauge.max_value) / 3:
		sb.bg_color = Color(1, 1, 0)  # Yellow for medium pollution
	else:
		sb.bg_color = Color(1, 0, 0)  # Red for high pollution



func simulate_pollution():
	for building in map.structures:
		print("Building type: ", typeof(building))
		print("Building class: ", building.get_class())
		if building is DataStructure:
			map.pollution += building.pollution_effect
		else:
			print("Error: Object in map.structures is not a DataStructure!")
	map.pollution = clamp(map.pollution, 0, pollution_gauge.max_value)
	update_resources()



func simulate_income():
	var total_income = 0

	# Calculate total income from all structures
	for data_structure in map.structures:
		if data_structure is DataStructure:
			var structure_index = data_structure.structure
			if structure_index >= 0 and structure_index < structures.size():
				var building = structures[structure_index]
				if building is Structure:
					total_income += building.income
			else:
				print("Error: Structure index out of bounds.")
		else:
			print("Error: Object in map.structures is not a DataStructure!")

	# Update cash
	map.cash += total_income
	update_cash_display()

	print("Income generated: ", total_income, " | New Cash Balance: ", map.cash)



func _initialize_building_income():
	print("Initializing building income timers...")
	for i in range(map.structures.size()):
		var data_structure = map.structures[i]
		if data_structure is DataStructure:
			var structure_index = data_structure.structure
			if structure_index >= 0 and structure_index < structures.size():
				var building = structures[structure_index]
				if building is Structure:
					# Create a timer for the building
					var building_timer = Timer.new()
					building_timer.wait_time = building.income_interval
					building_timer.one_shot = false
					building_timer.connect("timeout", Callable(self, "_on_building_income_timeout").bind(i))
					add_child(building_timer)
					building_timer.start()
					print("Income timer started for building:", building.name)
				else:
					print("Error: Object is not a Structure!")
			else:
				print("Error: Structure index out of bounds.")
		else:
			print("Error: Object in map.structures is not a DataStructure!")




func _on_building_income_timeout(building_index: int):
	var data_structure = map.structures[building_index]
	if data_structure is DataStructure:
		var structure_index = data_structure.structure
		if structure_index >= 0 and structure_index < structures.size():
			var building = structures[structure_index]
			if building is Structure:
				# Add the building's income to the player's cash
				map.cash += building.income
				update_cash_display()
				print("Building income added. Building:", building.name, "| Income:", building.income, "| Total Cash:", map.cash)
			else:
				print("Error: Object is not a Structure!")
		else:
			print("Error: Structure index out of bounds.")
	else:
		print("Error: Object in map.structures is not a DataStructure!")




func upgrade_building_income(building_index: int) -> void:
	var data_structure = map.structures[building_index]
	if data_structure is DataStructure:
		var structure_index = data_structure.structure
		if structure_index >= 0 and structure_index < structures.size():
			var building = structures[structure_index]
			if building.income_upgrade_level < building.max_income_upgrade_level:
				var cost = building.income_upgrade_costs[building.income_upgrade_level]
				if map.cash >= cost:
					# Deduct the cost
					map.cash -= cost
					# Upgrade the income
					building.income += building.income_boost_per_level[building.income_upgrade_level]
					# Increase the upgrade level
					building.income_upgrade_level += 1
					print("Income upgraded for building:", building.name)
					update_cash_display()
				else:
					print("Not enough cash to upgrade income for building:", building.name)
			else:
				print("Maximum income upgrade level reached for building:", building.name)



func upgrade_building_pollution(building_index: int) -> void:
	var data_structure = map.structures[building_index]
	if data_structure is DataStructure:
		var structure_index = data_structure.structure
		if structure_index >= 0 and structure_index < structures.size():
			var building = structures[structure_index]
			if building.pollution_upgrade_level < building.max_pollution_upgrade_level:
				var cost = building.pollution_upgrade_costs[building.pollution_upgrade_level]
				if map.cash >= cost:
					# Deduct the cost
					map.cash -= cost
					# Reduce the pollution effect
					building.pollution_effect -= building.pollution_reduction_per_level[building.pollution_upgrade_level]
					# Ensure pollution effect doesn't go below zero
					building.pollution_effect = max(0, building.pollution_effect)
					# Increase the upgrade level
					building.pollution_upgrade_level += 1
					print("Pollution reduced for building:", building.name)
					update_cash_display()
				else:
					print("Not enough cash to reduce pollution for building:", building.name)
			else:
				print("Maximum pollution upgrade level reached for building:", building.name)




func update_cash_display():
	if not is_instance_valid(cash_display):
		print("Error: cash_display is null!")
		return
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

		update_resources()
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
		
		game_timer = Timer.new()
		game_timer.wait_time = 600.0  # 10 minutes = 600 seconds
		game_timer.one_shot = true
		game_timer.connect("timeout", Callable(self, "_on_game_timer_timeout"))
		add_child(game_timer)
		game_timer.start()
		
		# Update the cash display based on the reset premade map's cash value
		update_resources()
		print("Reset completed. Cash: ", map.cash)
