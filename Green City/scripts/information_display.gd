extends Control

@onready var building_name_label = $BuildingNameLabel
@onready var building_income_label = $BuildingIncomeLabel
@onready var building_info_label = $InfoLabel
@onready var pollution_effect_label = $PollutionEffectLabel
@onready var income_upgrade_button = $IncomeUpgradeButton
@onready var pollution_upgrade_button = $PollutionUpgradeButton
@onready var close_button = $CloseButton  # Add reference to the close button


# Index of the current building
var current_building_index: int = -1

func _ready() -> void:
	self.visible = false
	# Connect the close button signal
	close_button.connect("pressed", Callable(self, "_on_close_button_pressed"))

# Updates the information panel with building details
func update_info_panel(structure: Resource, index: int) -> void:
	if structure:
		self.visible = true
		current_building_index = index

		# Update labels
		building_name_label.text = "Name: " + structure.name
		building_income_label.text = "Income: $" + str(structure.income)
		pollution_effect_label.text = "Pollution Effect: " + str(structure.pollution_effect)
		building_info_label.text = structure.info

		# Update button text and state
		var main_node = get_tree().root.get_node("Main")  # Replace "Main" if necessary
		print("Main node:", main_node)
		if main_node and main_node.has_method("reactivate_gameplay_on_panel_close"):
			main_node.reactivate_gameplay_on_panel_close()
		else:
			print("Error: Main node or reactivate_gameplay_on_panel_close method not found!")

		if main_node and main_node.has_method("get_map"):
			var map = main_node.get_map()
			if map:
				income_upgrade_button.text = "Upgrade Income ($" + str(structure.income_upgrade_cost) + ")"
				income_upgrade_button.disabled = map.cash < structure.income_upgrade_cost
				pollution_upgrade_button.text = "Reduce Pollution ($" + str(structure.pollution_upgrade_cost) + ")"
				pollution_upgrade_button.disabled = map.cash < structure.pollution_upgrade_cost
	else:
		self.visible = false
		current_building_index = -1

# Disable selector when the mouse enters the panel
func _on_panel_mouse_entered():
	var main_node = get_tree().root.get_node("Main")  # Replace "Main" with your main scene name if different
	if main_node:
		main_node.selector.set_process(false)  # Disable the selector
		print("Selector disabled: Mouse is over the panel.")

# Enable selector when the mouse exits the panel
func _on_panel_mouse_exited():
	var main_node = get_tree().root.get_node("Main")  # Replace "Main" with your main scene name if different
	if main_node:
		main_node.selector.set_process(true)  # Enable the selector
		print("Selector enabled: Mouse left the panel.")

# Handle close button press
func _on_close_button_pressed():
	self.visible = false
	current_building_index = -1
	var main_node = get_tree().root.get_node("Main")
	print("Main node:", main_node)
	if main_node and main_node.has_method("reactivate_gameplay_on_panel_close"):
		print("Calling reactivate_gameplay_on_panel_close method on Main.")
		main_node.reactivate_gameplay_on_panel_close()
	else:
		print("Error: Main node or reactivate_gameplay_on_panel_close method not found!")
