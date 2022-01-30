extends Node2D

var speed = 130
var going = false
var start_boxes_removed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if going:
		$sprites.visible = true
		self.position.x -= delta*speed
	
	if !start_boxes_removed:
		start_boxes_removed = true
		var boxes = get_tree().get_nodes_in_group("start_boxes")
		
		for box in boxes:
			box.queue_free()
			
		var lights = get_tree().get_nodes_in_group("start_light")
		
		for light in lights:
			light.visible = true
	
