extends Resource
class_name Structure

@export_subgroup("Name")
@export var name: String = "Default Building"

@export_subgroup("Model")
@export var model:PackedScene # Model of the structure

@export_subgroup("Gameplay")
@export var price:int # Price of the structure when building

@export_subgroup("Type")
@export var type: String = "Type"
