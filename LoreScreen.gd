extends Node2D

onready var menu_button = $"MenuButton"
onready var background = $"Background"
onready var text = $"Text"

func _process(delta):
	scaleElements()
	
# Scale the elements according to the screen
func scaleElements():

	# Make the background cover the screen
	background.margin_right = get_viewport().size.x
	background.margin_bottom = get_viewport().size.y

	text.rect_size.x = get_viewport().size.x
	text.rect_size.y = get_viewport().size.y * 0.7

	# Scale the menu button accordingly
	menu_button.margin_right = get_viewport().size.x * 0.7
	menu_button.margin_left = get_viewport().size.x * 0.3
	menu_button.margin_top = get_viewport().size.y * 0.6
	menu_button.margin_bottom = get_viewport().size.y * 0.7
