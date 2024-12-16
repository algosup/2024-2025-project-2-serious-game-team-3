extends Label

# Scrolling parameters
var scroll_speed: int = 350  # Pixels per second
var pause_duration: float = 1.0  # Pause duration after the text scrolls out
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

func _ready() -> void:
	# Adjust for screen size dynamically
	adjust_for_screen_size()

	# Start the label off-screen to the right
	position.x = get_viewport().size.x

	# Debug: Print initial position and size
	print("Initial BannerLabel position: ", position, " Width: ", size.x)

	# Set the initial message
	text = messages[current_message_index]
	minimum_size_changed()

func _process(delta: float) -> void:
	if not is_paused:
		# Move the label to the left
		position.x -= scroll_speed * delta

		# Check if the text has completely scrolled out of view
		if position.x + size.x < 0:
			_on_text_out_of_view()

func _on_text_out_of_view() -> void:
	is_paused = true
	current_message_index = (current_message_index + 1) % messages.size()  # Cycle to the next message
	text = messages[current_message_index]

	# Pause briefly, then reset position
	await get_tree().create_timer(pause_duration).timeout
	position.x = get_viewport().size.x  # Reset position to off-screen to the right
	is_paused = false

func minimum_size_changed() -> void:
	# Dynamically adjust label size to fit text
	var estimated_width = text.length() * 10  # Approximate width per character
	size = Vector2(estimated_width, size.y)

func adjust_for_screen_size() -> void:
	# Adjust the banner to align with the screen or parent size
	var viewport_size = get_viewport().get_visible_rect().size
	size = Vector2(viewport_size.x, size.y)  # Adjust width to match screen width
	position.y = viewport_size.y - size.y - 50  # Position near bottom of screen
