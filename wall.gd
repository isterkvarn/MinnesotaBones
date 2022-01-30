extends Node2D

var speed = 130
var going = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if going:
		$sprites.visible = true
		self.position.x -= delta*speed
