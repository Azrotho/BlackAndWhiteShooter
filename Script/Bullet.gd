extends Node2D


@export var speed: int = 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * speed * delta


func _on_kill_timer_timeout():
	queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body.name)
