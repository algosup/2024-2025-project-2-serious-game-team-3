extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Get the current window size
	var screen_size = DisplayServer.window_get_size()
	print("Detected Screen Resolution: ", screen_size)

	# Set the resolution dynamically
	ProjectSettings.set_setting("display/window/size/width", screen_size.x)
	ProjectSettings.set_setting("display/window/size/height", screen_size.y)

	# Optional: Save the settings (this persists them to the project.godot file)
	ProjectSettings.save()

func _process(delta):
	if Input.is_action_just_pressed("return_to_menu"):
		print("ui_menu action triggered, returning to menu...")
		return_to_menu()

func return_to_menu():  # Replace with the path to your menu scene
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
