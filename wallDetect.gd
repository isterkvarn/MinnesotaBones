extends Area2D


func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body.is_in_group("player"):
		# play escape music
		body.play_runmusic()
		var canvas = get_parent().get_parent().get_parent().get_parent().get_node("CanvasModulate")
		canvas.set_color(Color(0.25, 0.01, 0.01, 1))
		get_parent().going = true
		queue_free()
#	pass
