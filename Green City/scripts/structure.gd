extends Resource
class_name Structure

@export_subgroup("Name")
@export var name: String = "building"

@export_subgroup("Model")
@export var model: PackedScene # Model of the structure

@export_subgroup("Gameplay")
@export var income: int # Price of the structure when building
@export var income_interval: float = 1.0  # Time interval in seconds for income generation
@export var pollution_effect: float # Increase or decrease in pollution
@export var info: String

# Upgrade path 1: Increase income
@export var income_upgrade_level: int = 0
@export var max_income_upgrade_level: int = 3
@export var income_upgrade_costs: Array[int] = [100, 200, 300]
@export var income_boost_per_level: Array[int] = [10, 20, 30]

# Upgrade path 2: Reduce pollution
@export var pollution_upgrade_level: int = 0
@export var max_pollution_upgrade_level: int = 3
@export var pollution_upgrade_costs: Array[int] = [150, 250, 350]
@export var pollution_reduction_per_level: Array[float] = [0.1, 0.2, 0.3]
@export_subgroup("Type")
@export var type: String = "Type"
