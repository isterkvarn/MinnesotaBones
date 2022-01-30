extends Label

func _process(delta):
	self.rect_size.x = get_viewport().size.x
	self.rect_size.y = get_viewport().size.y * 0.5
