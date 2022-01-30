extends Button

const MAIN_SCENE_PATH = "res://main.tscn"

func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	print("")
	get_tree().change_scene(MAIN_SCENE_PATH)
