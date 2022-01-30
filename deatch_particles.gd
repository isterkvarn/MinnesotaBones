extends Node2D


onready var bones = $bones_part
onready var hat = $hat_part
onready var feet = $feet_part
onready var skull = $skull_part



# Called when the node enters the scene tree for the first time.
func _ready():
	bones.emitting = true
	hat.emitting = true
	feet.emitting = true
	skull.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
