extends Area2D

const WIN_SCREEN_PATH = "res://WinScreen.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	# Call the game over screen
	get_tree().change_scene(WIN_SCREEN_PATH)
