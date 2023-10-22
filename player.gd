extends CharacterBody2D

@export var speed = 500

@onready var air_gust = $LeafBlower/AirGust
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var click_position

func _ready():
	click_position = Vector2(position.x, position.y)
	
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("left_click"):
		click_position = get_global_mouse_position()
		
	var target_position = (click_position - position).normalized()
	
	if position.distance_to(click_position) > 30:
		velocity = target_position * speed
		move_and_slide()
		air_gust.visible = true
		if not audio_stream_player_2d.playing:
			audio_stream_player_2d.play()
	else:
		air_gust.visible = false
		#look_at(click_position)
		if audio_stream_player_2d.playing:
			audio_stream_player_2d.stop()
