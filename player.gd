extends KinematicBody2D

const move_speed = 200
const jump_force = 500
const gravity = 20
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
		
	# play right animationdepending on movement
	if is_on_floor():
		if vel.length() > 0:
			sprite.play("walk")
		else:
			sprite.play("idel")
			sprite.frame = 0
		# No gravity if on ground
		vel.y = 0
	else:
		# gravity and jump anmi if in air
		vel.y += gravity
		sprite.play("jump")
	
	# Squat and stop player while holding jump
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.x = 0
		sprite.play("squat")
		
	# Jump when button is released
	if Input.is_action_just_released("jump") and is_on_floor():
		vel.y -= jump_force
		
	# Flip sprite in right direction
	if vel.x > 0:
		sprite.flip_h = false
	elif vel.x < 0:
		sprite.flip_h = true

	move_and_slide(vel, Vector2.UP, false, 4, 0.785398, false)
