extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Player:
		body.velocity.y = -1000
		body.velocity.x = randf_range(-1, 1) * 2000
		#body.queue_free()
