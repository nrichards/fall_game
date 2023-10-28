extends Sprite2D

@onready var area_2d = $Area2D
@onready var leaf_blower = $"../.."

var original_gse

func _ready():
	leaf_blower.moving.connect(is_moving)

	original_gse = area_2d.gravity_space_override
	area_2d.gravity_space_override = area_2d.SPACE_OVERRIDE_DISABLED
	


func is_moving(moving):
	if moving: 
		if not visible:
			visible = true

			area_2d.gravity_space_override = original_gse
		
	else:
		if visible:
			visible = false

			area_2d.gravity_space_override = area_2d.SPACE_OVERRIDE_DISABLED

