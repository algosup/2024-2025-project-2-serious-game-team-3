extends Resource
class_name Structure

@export_subgroup("Name")
@export var name: String = "building"

@export_subgroup("Model")
@export var model: PackedScene # Model of the structure

@export_subgroup("Gameplay")
@export var price: int # Price of the structure when building
@export var pollution_effect: float # Increase or decrease in pollution
@export var info: String

@export_subgroup("Type")
@export var type: String = "Type"
