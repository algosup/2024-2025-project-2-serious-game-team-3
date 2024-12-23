extends Label

# Scrolling parameters
var scroll_speed: int = 350  # Pixels per second
var pause_duration: float = 0  # Pause duration after the text scrolls out
var messages: Array = [
	"Over 10,000 cities have pledged to reduce emissions under the Paris Agreement. Is yours one of them?", 
	"Recycling wastewater can reduce urban water emissions by up to 80%.", 
	"Rooftop solar panels could supply 40% of a city's energy needs.",
	"Nine out of ten people worldwide breathe polluted air, most of which comes from city emissions.",
	"Adding urban forests can reduce a city’s temperature by 2–4°C, combating heat islands.",
	"Composting food waste reduces methane emissions by 80% compared to landfills.",
	"Switching to biodegradable materials can cut plastic-related urban emissions by 60%."
]  # List of scrolling messages

# Internal variables
var current_message_index: int = 0
var is_paused: bool = false

# Start with test coordinates for debugging
var start_position: Vector2 = Vector2(3000, 1700)  # Adjust these values incrementally

func _ready() -> void:
	# Set the starting position
	position = start_position

	# Debug: Print the initial position
	print("Initial BannerLabel position: ", position)

	# Dynamically adjust the label's width to fit the text
	text = messages[current_message_index]
	minimum_size_changed()

func _process(delta: float) -> void:
	if not is_paused:
		# Move the label to the left
		position.x -= scroll_speed * delta

		# Debug: Print the label's position each frame
		#print("BannerLabel position: ", position)

		# Check if the text has completely scrolled out of view
		if position.x + size.x < 0:
			_on_text_out_of_view()

func _on_text_out_of_view() -> void:
	is_paused = true
	current_message_index = (current_message_index + 1) % messages.size()  # Cycle to the next message
	text = messages[current_message_index]

	# Reset position and pause before resuming
	await get_tree().create_timer(pause_duration).timeout
	position = start_position  # Reset the position to the test starting point
	is_paused = false

func minimum_size_changed() -> void:
	# Estimate the size of the text to adjust the label's size dynamically
	var estimated_width = text.length() * 10  # Approximate width per character
	size = Vector2(estimated_width, size.y)
