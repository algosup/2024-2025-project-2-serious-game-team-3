extends Control

@onready var building_name_label = $BuildingNameLabel
@onready var building_income_label = $BuildingIncomeLabel
@onready var building_info_label = $InfoLabel
@onready var pollution_effect_label = $PollutionEffectLabel
@onready var income_upgrade_button = $IncomeUpgradeButton
@onready var pollution_upgrade_button = $PollutionUpgradeButton
@onready var close_button = $CloseButton  # Add reference to the close button
@onready var income_price_label = $IncomePriceLabel
@onready var reduce_price_label = $ReducePrice


# Index of the current building
var current_building_index: int = -1

func _ready() -> void:
	self.visible = false

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

		# Update button text and state dynamically
		var main_node = get_tree().root.get_node("Main/Builder")
		if main_node and main_node.has_method("get_map"):
			var map = main_node.get_map()
			if map:
				# Income upgrade
				if structure.income_upgrade_level >= structure.max_income_upgrade_level:
					income_price_label.text = "Maxed out"
					income_upgrade_button.disabled = true
				else:
					var income_upgrade_cost = structure.income_upgrade_cost_base * pow(structure.income_upgrade_cost_multiplier, structure.income_upgrade_level)
					income_price_label.text = "Price: " + str(income_upgrade_cost) + "$"
					income_upgrade_button.disabled = map.cash < income_upgrade_cost

				# Pollution reduction upgrade
				if structure.pollution_upgrade_level >= structure.max_pollution_upgrade_level:
					reduce_price_label.text = "Maxed out"
					pollution_upgrade_button.disabled = true
				else:
					var pollution_upgrade_cost = structure.pollution_upgrade_cost_base * pow(structure.pollution_upgrade_cost_multiplier, structure.pollution_upgrade_level)
					reduce_price_label.text = "Price: " + str(pollution_upgrade_cost) + "$"
					pollution_upgrade_button.disabled = map.cash < pollution_upgrade_cost
	else:
		self.visible = false
		current_building_index = -1



# Disable selector when the mouse enters the panel
func _on_panel_mouse_entered():
	var main_node = get_tree().root.get_node("Main/Builder")  # Replace "Main" with your main scene name if different
	if main_node:
		main_node.selector.set_process(false)  # Disable the selector
		print("Selector disabled: Mouse is over the panel.")

# Enable selector when the mouse exits the panel
func _on_panel_mouse_exited():
	var main_node = get_tree().root.get_node("Main/Builder")  # Replace "Main" with your main scene name if different
	if main_node:
		main_node.selector.set_process(true)  # Enable the selector
		print("Selector enabled: Mouse left the panel.")

# Handle close button press
func _on_close_button_pressed():
	self.visible = false
	current_building_index = -1
	var main_node = get_tree().root.get_node("Main/Builder")
	print("Main node:", main_node)
	if main_node and main_node.has_method("reactivate_gameplay_on_panel_close"):
		print("Calling reactivate_gameplay_on_panel_close method on Main.")
		main_node.reactivate_gameplay_on_panel_close()
	else:
		print("Error: Main node or reactivate_gameplay_on_panel_close method not found!")

func _on_income_upgrade_button_pressed() -> void:
	print("Income Upgrade Button Pressed")
	if current_building_index != -1:
		var main_node = get_tree().root.get_node("Main/Builder")
		if main_node and main_node.has_method("upgrade_building_income"):
			main_node.upgrade_building_income(current_building_index)
			# Get the updated structure and refresh the panel
			var structure = main_node.structures[current_building_index]
			update_info_panel(structure, current_building_index)
		else:
			print("Error: Main node or method not found!")

func _on_pollution_upgrade_button_pressed() -> void:
	print("Pollution Upgrade Button Pressed")
	if current_building_index != -1:
		var main_node = get_tree().root.get_node("Main/Builder")
		if main_node and main_node.has_method("upgrade_building_pollution"):
			main_node.upgrade_building_pollution(current_building_index)
			# Get the updated structure and refresh the panel
			var structure = main_node.structures[current_building_index]
			update_info_panel(structure, current_building_index)
		else:
			print("Error: Main node or method not found!")
