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
@export var income_upgrade_ratio: float = 0.1 # 10% increase per level
@export var income_upgrade_cost_base: float = 100.0 # Base cost for income upgrade
@export var income_upgrade_cost_multiplier: float = 2.0 # Cost multiplier per level

# Upgrade path 2: Reduce pollution
@export var pollution_upgrade_level: int = 0
@export var max_pollution_upgrade_level: int = 3
@export var pollution_reduction_ratio: float = 0.1 # 10% reduction per level
@export var pollution_upgrade_cost_base: float = 150.0 # Base cost for pollution upgrade
@export var pollution_upgrade_cost_multiplier: float = 2.0 # Cost multiplier per level

@export_subgroup("Type")
@export var type: String = "Type"
