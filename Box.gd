extends RigidBody2D

const gravity : int = 10

func _ready():
	# Make the box not able to rotate
	set_mode(MODE_CHARACTER)
	# Make the box able to sleep when there is no movement
	set_can_sleep(true)
	# Set the gravity scale
	set_gravity_scale(gravity)
	set_continuous_collision_detection_mode(2)
	
