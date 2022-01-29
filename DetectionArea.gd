extends Area2D

var is_touched : bool = false
var destroy_counter : float = 0.0
# The delay before the block should be destroyed
const DESTROY_TIME : int = 3

onready var falling_block = get_parent()

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _process(delta):
	if is_touched:
		if destroy_counter > DESTROY_TIME:
			falling_block.destroy()
		else:
			print(destroy_counter)
			destroy_counter += delta

func _on_body_entered(body):
	if body.is_in_group("player"):
		is_touched = true
