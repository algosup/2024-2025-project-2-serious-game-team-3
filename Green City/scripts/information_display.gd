extends Control

@onready var building_name_label = $BuildingNameLabel
@onready var building_income_label = $BuildingIncomeLabel
@onready var pollution_effect_label = $PollutionEffectLabel
@onready var info_label = $InfoLabel
@onready var money_button = $MoneyButton
@onready var co2_button = $CO2Button
@onready var production_label = $ProductionRatesLabel  # To show production rates dynamically

# Production rates
var money_production_rate: float = 1.0  # Default 100% rate
var co2_production_rate: float = 1.0  # Default 100% rate

# Initially, the panel is hidden
func _ready() -> void:
	print("[DEBUG] _ready(): Initializing Panel")
	self.visible = false  # Panel starts hidden

	# Connect button signals
	if money_button:
		print("[DEBUG] _ready(): Connecting MoneyButton")
		money_button.connect("pressed", Callable(self, "_on_money_button_pressed"))
	else:
		print("[ERROR] _ready(): MoneyButton not found!")

	if co2_button:
		print("[DEBUG] _ready(): Connecting CO2Button")
		co2_button.connect("pressed", Callable(self, "_on_co2_button_pressed"))
	else:
		print("[ERROR] _ready(): CO2Button not found!")

	_update_production_label()  # Initialize the production rates display

# Call this method to update the displayed information based on a building
func update_info_panel(structure: Resource) -> void:
	print("[DEBUG] update_info_panel(): Called with structure: ", structure)
	if structure:
		print("[DEBUG] update_info_panel(): Updating Panel for structure: ", structure.name)
		self.visible = true

		# Update labels
		if building_name_label and building_income_label and pollution_effect_label:
			building_name_label.text = "Name: " + structure.name
			building_income_label.text = "Income: $" + str(structure.income)
			pollution_effect_label.text = "Pollution Effect: " + str(structure.pollution_effect)
			info_label.text = structure.info
			print("[DEBUG] update_info_panel(): Panel updated successfully")
		else:
			print("[ERROR] update_info_panel(): One or more labels are not properly assigned!")
	else:
		print("[DEBUG] update_info_panel(): No structure provided. Hiding Panel.")
		self.visible = false

# Money Button logic
func _on_money_button_pressed() -> void:
	print("[DEBUG] _on_money_button_pressed(): MoneyButton pressed")
	money_production_rate += 0.1
	print("[DEBUG] _on_money_button_pressed(): Money rate increased to: ", money_production_rate)
	_update_production_label()

# CO2 Button logic
func _on_co2_button_pressed() -> void:
	print("[DEBUG] _on_co2_button_pressed(): CO2Button pressed")
	co2_production_rate = max(co2_production_rate - 0.01, 0)
	print("[DEBUG] _on_co2_button_pressed(): CO2 rate decreased to: ", co2_production_rate)
	_update_production_label()

# Update the production rates label
func _update_production_label() -> void:
	if production_label:
		print("[DEBUG] _update_production_label(): Updating ProductionRatesLabel")
		production_label.text = "Money Rate: " + str(round(money_production_rate * 100)) + "%\nCO2 Rate: " + str(round(co2_production_rate * 100)) + "%"
	else:
		print("[ERROR] _update_production_label(): ProductionRatesLabel not found!")
