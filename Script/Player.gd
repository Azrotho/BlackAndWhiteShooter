extends CharacterBody2D


const SPEED = 10000.0
var direction
var axis = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
		move(delta)
		
func get_input_axis():
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis

func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.ZERO:
		pass
	
		
	velocity = axis.normalized() * SPEED * delta
	
	move_and_slide()
	


func _on_input_event(viewport, event, shape_idx):
	print(event)
