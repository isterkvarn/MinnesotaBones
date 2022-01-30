extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	self.margin_right = get_viewport().size.x * 1
	self.margin_left = get_viewport().size.x * 0.5 - self.rect_size.y
	
	print(get_viewport().size.x)
	print()
	
	self.margin_top = get_viewport().size.y * 0.1
	self.margin_bottom = get_viewport().size.y * 0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
