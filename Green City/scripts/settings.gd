extends Control

var last_window_size = Vector2i.ZERO  # Keep track of the last known window size
# Called when the node enters the scene tree for the first time.
	
	
func _process(delta):
	var current_window_size = DisplayServer.window_get_size()
	if current_window_size != last_window_size:  # Compare Vector2i types
		print("Window resized!")
		last_window_size = current_window_size
	if Input.is_action_just_pressed("return_to_menu"):
		print("ui_menu action triggered, returning to menu...")
		return_to_menu()

func return_to_menu():  # Replace with the path to your menu scene
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/16)


func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
		3:
			DisplayServer.window_set_size(Vector2i(3840,2160))
			


func _on_mute_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), toggled_on)


func _on_display_item_selected(index: int):
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN)
			var size = DisplayServer.screen_get_size()
			DisplayServer.window_set_size(size)
			print("Fullscreen mode. Screen size:", size)
		1:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			var size = DisplayServer.screen_get_size()
			DisplayServer.window_set_size(size)
			print("Exclusive fullscreen mode. Screen size:", size)
		2:
			DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
			var size = DisplayServer.window_get_size()
			print("Windowed mode. Current window size:", size)
	
	# Save the selected mode
	ProjectSettings.set_setting("display/window/mode", index)
	ProjectSettings.save()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
