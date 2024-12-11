extends Control

@export var pollution_score_label: Label  # Label to display the pollution score
@export var grade_label: Label  # Label to display the grade
@export var restart_button: Button  # Button to restart
@export var menu_button: Button  # Button to return to the menu or restart

var game_map: DataMap  # Holds the DataMap resource

func _ready():
	# Check if game_map is set before accessing it
	if game_map:
		var pollution = game_map.pollution
		var pollution_score = pollution / 1000  # Scale pollution to 0-100
		
		# Update the labels
		pollution_score_label.text = "Final Pollution Score: " + str(round(pollution_score)) + " / 100"
		
		# Calculate and display the grade
		var grade = calculate_grade(round(pollution_score))
		grade_label.text = "Grade: " + grade
	else:
		print("Error: Game data not passed to winning scene!")
		pollution_score_label.text = "Score: Data not available"
		grade_label.text = "Grade: N/A"

	# Connect the button signal
	restart_button.connect("pressed", Callable(self, "_on_restart_button_pressed"))

func set_game_data(map: DataMap):
	# Set the map data for this scene
	game_map = map

func _on_restart_button_pressed():
	# Free the current Winning Scene
	self.queue_free()  # This removes the current scene instance

	# Load the main game scene
	get_tree().change_scene_to_file("res://scenes/main.tscn")

	
func _on_menu_button_pressed():
	# Free the current Winning Scene
	self.queue_free()  # This removes the current scene instance

	# Load the main menu scene
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


# Calculate grade based on the pollution score
func calculate_grade(score: int) -> String:
	if score <= 10:
		return "A+"
	elif score <= 25:
		return "A"
	elif score <= 40:
		return "B"
	elif score <= 60:
		return "C"
	elif score <= 80:
		return "D"
	else:
		return "F"
