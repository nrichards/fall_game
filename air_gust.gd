extends Sprite2D

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D

var original_gse

func _ready():
	original_gse = area_2d.gravity_space_override
	area_2d.gravity_space_override = area_2d.SPACE_OVERRIDE_DISABLED


func is_moving(moving):
	if moving and not visible:
		visible = true
		area_2d.gravity_space_override = original_gse
		
	elif not moving and visible:
		visible = false
		area_2d.gravity_space_override = area_2d.SPACE_OVERRIDE_DISABLED

