extends Button

const LORE_SCENE_PATH = "res://LoreScreen.tscn"

func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	get_tree().change_scene(LORE_SCENE_PATH)
