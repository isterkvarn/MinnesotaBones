extends KinematicBody2D

const move_speed = 100
const jump_force = 100
var vel = Vector2(0, 0)

onready var sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Nullify previous movement
	vel.x = 0
	
	# Move player left and right on input
	if Input.is_action_pressed("move_left"):
		vel.x = -move_speed

	if Input.is_action_pressed("move_right"):
		vel.x = move_speed
		
	# Play walk animation of moving, otherwise idel
	if vel.length() > 0:
		sprite.play("walk")
		sprite.playing = true
	else:
		sprite.play("idel")
		sprite.playing = false
		sprite.frame = 0
	
	# Squat and stop player while holding jump
	if Input.is_action_pressed("jump"):
		vel.x = 0
		sprite.play("squat")
		
	if Input.is_action_just_released("jump"):
		vel.y -= jump_force
		
	if vel.x > 0:
		sprite.flip_h = false
	elif vel.x < 0:
		sprite.flip_h = true

	move_and_slide(vel, Vector2.UP)
