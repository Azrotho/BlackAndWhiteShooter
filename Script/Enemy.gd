extends Node2D

const bullet_scene = preload("res://Scenes/Bullet.tscn")

@onready var shooter_timer = $ShootTimer
@onready var rotator = $Rotator

@export var rotate_speed:int = 100
@export var shooter_timer_wait_time:float = 0.1
@export var spawn_point_count:int = 10
@export var radius:int = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	var step = 2 * PI / spawn_point_count
	
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle() 
		rotator.add_child(spawn_point)
		
	shooter_timer.wait_time = shooter_timer_wait_time
	shooter_timer.start()
	
func _on_shoot_timer_timeout():
	for s in rotator.get_children():
		var bullet = bullet_scene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_rotation = rotator.rotation_degrees + rotate_speed * delta
	rotator.rotation_degrees = fmod(new_rotation, 360)


