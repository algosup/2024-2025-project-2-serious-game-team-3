extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("return_to_menu"):
		print("ui_menu action triggered, returning to menu...")
		return_to_menu()

func return_to_menu():  # Replace with the path to your menu scene
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
