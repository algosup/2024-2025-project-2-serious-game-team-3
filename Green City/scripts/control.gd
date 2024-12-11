extends Node

# Cash variable to keep track of current cash
var cash: int = 10000  # Initial cash amount

# Passive income increment value
const PASSIVE_INCOME = 50  # Amount to add every second

# Timer to handle passive income increment
var income_timer: Timer = null

func _ready():
	# Create and configure the Timer dynamically
	income_timer = Timer.new()
	income_timer.wait_time = 1.0  # 1-second interval
	income_timer.autostart = true
	income_timer.one_shot = false
	add_child(income_timer)
	income_timer.connect("timeout", Callable(self, "_on_income_timer_timeout"))

	# Debug: Verify the Cash label node
	var cash_label = $Cash
	if cash_label:
		print("Cash label found: ", cash_label)
	else:
		print("Error: Cash label node not found! Verify node path.")
		print_tree()  # Prints the entire scene tree for debugging

	# Initialize cash display
	_update_cash_display()
	print("Passive income system initialized.")

func _on_income_timer_timeout():
	# Increment cash passively each second
	cash += PASSIVE_INCOME
	_update_cash_display()
	print("Passive income added. New cash total: ", cash)

func _update_cash_display():
	# Locate and update the cash display label dynamically
	var cash_label = $Cash
	if cash_label:
		cash_label.text = "$" + str(cash)
	else:
		print("Error: Cash label node not found! Cannot update display.")
