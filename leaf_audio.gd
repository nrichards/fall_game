extends AudioStreamPlayer2D

# Fades in to original 'volume_db' and out to a silent db
# Avoids seeking to start when resuming during a fade out 
# Listens for 'moving' signal to control fading

@onready var leaf_blower = $".."

const ramp_up_rate = 550.0
const ramp_down_rate = 50.0
const min_volume_db = -80.0

var stopping = true
var original_volume_db

func _ready():
	original_volume_db = volume_db 
	volume_db = min_volume_db
	leaf_blower.moving.connect(is_moving)


# Fades out and stops if stopping
# Fades in if playing
func _physics_process(delta):
	if stopping and playing:
		volume_db = volume_db - (ramp_down_rate * delta)
		if volume_db < min_volume_db:
			stop()
	elif not stopping:
		if playing:
			if volume_db < original_volume_db:
				volume_db = volume_db + (ramp_up_rate * delta)
		else:
			play()



# Set state variables based upon intention of 'moving' 
func is_moving(moving):
	if moving:
		stopping = false
	elif playing and not stopping:
		stopping = true
