extends CharacterBody2D

@export var speed = 500
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

signal moving(is_moving)

const stopped_distance = 15

var click_position


func _ready():
	click_position = Vector2(position.x, position.y)
	
	
func _physics_process(delta):
	var pressed = Input.is_action_pressed("left_click")
	
	if pressed:
		click_position = get_global_mouse_position()
		
	var target_position = (click_position - position).normalized()
	
	if pressed or position.distance_to(click_position) > stopped_distance:
		velocity = target_position * speed
		move_and_slide()
		moving.emit(true)
	
	elif not pressed:
		moving.emit(false)



