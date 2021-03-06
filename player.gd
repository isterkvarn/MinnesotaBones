extends KinematicBody2D

const move_speed = 200
const jump_force = 400
const gravity = 20
var vel = Vector2(0, 0)
var dead = false
const death_particles = preload("res://death_particles.tscn")
var cheating = false

onready var sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	set_safe_margin(0.4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Nullify previous movement
	vel.x = 0
	
	# Move player left and right on input
	if Input.is_action_pressed("move_left"):
		vel.x = -move_speed

	if Input.is_action_pressed("move_right"):
		vel.x = move_speed
		
	if (Input.is_action_pressed("cheats1") and 
		Input.is_action_pressed("cheats2") and
		Input.is_action_pressed("cheats3") and
		Input.is_action_pressed("cheats4") and
		Input.is_action_pressed("move_left")):
			cheating = true
	
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
		
		# Fixws bug where player flips animations on walls
		if is_on_wall():
			if vel.length() > 0:
				sprite.play("walk")
			else:
				sprite.play("idel")
				sprite.frame = 0
		# if no floor or wall collison play jump
		else:
			sprite.play("jump")
	
	# Squat and stop player while holding jump
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.x = 0
		sprite.play("squat")
		
	# Jump when button is released
	if Input.is_action_just_released("jump") and (is_on_floor() or cheating):
		vel.y -= jump_force
		
	# Flip sprite in right direction
	if vel.x > 0:
		sprite.flip_h = false
	elif vel.x < 0:
		sprite.flip_h = true
	else:
		# Makes it so you can change direvtion while squating
		if Input.is_action_pressed("move_left"):
			sprite.flip_h = true
		if Input.is_action_pressed("move_right"):
			sprite.flip_h = false
			
	move_and_slide(vel, Vector2.UP, false, 4, 0.785398, false)
	
	# Check every object that is currently colliding with the player
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		# If the collision is a body, apply an impulse force to it
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * 20)

func play_runmusic():
	$runmusic.playing = true
	$cavemusic.playing = false

func die():
	if !dead:
		# create deathparticles
		var death_par = death_particles.instance()
		death_par.global_position = self.position
		get_parent().add_child(death_par)
		
		# move camera to mainscene
		var camera = $Camera2D
		remove_child(camera)
		get_parent().add_child(camera)
		camera.global_position = self.global_position
		
		var runmusic = $runmusic
		remove_child(runmusic)
		get_parent().add_child(runmusic)
		
		dead = true
		queue_free()
