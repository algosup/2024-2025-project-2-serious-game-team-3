extends Control

@onready var building_name_label = $BuildingNameLabel
@onready var building_price_label = $BuildingPriceLabel
@onready var pollution_effect_label = $PollutionEffectLabel
@onready var info_label = $InfoLabel

# Initially, the panel is hidden
func _ready() -> void:
	self.visible = false

# Call this method to update the displayed information based on a building
func update_info_panel(structure: Resource) -> void:
	if structure:
		print("Updating InfoPanel: ", structure.name)  # Debug print
		self.visible = true

		# Update labels
		if building_name_label and building_price_label and pollution_effect_label:
			building_name_label.text = "Name: " + structure.name
			building_price_label.text = "Price: $" + str(structure.price)
			pollution_effect_label.text = "Pollution Effect: " + str(structure.pollution_effect)
			info_label.text = structure.info
			print("Panel updated: ", structure.name, ", Price: ", structure.price, ", Pollution Effect: ", structure.pollution_effect)  # Debug print
			
		else:
			print("One or more labels are not properly assigned.")
	else:
		self.visible = false
		print("Hiding InfoPanel")  # Debug print
