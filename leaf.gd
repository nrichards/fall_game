extends RigidBody2D

@onready var timer = $Timer


func _ready():
	timer.wait_time = randf_range(0.5, 15.0)
	timer.start()


func on_leaf_start_falling():
	freeze = false
