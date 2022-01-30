extends Node2D


onready var bones = $bones_part
onready var hat = $hat_part
onready var feet = $feet_part
onready var skull = $skull_part

var death_timer = 0
const TIME_BEFORE_DEATH_SCREEN = 3
const DEATH_SCREEN_PATH = "res://GameOverScreen.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	bones.emitting = true
	hat.emitting = true
	feet.emitting = true
	skull.emitting = true

func _process(delta):	
	if death_timer < TIME_BEFORE_DEATH_SCREEN:
		death_timer += delta
	else:
		# Call the game over screen
		get_tree().change_scene(DEATH_SCREEN_PATH)
