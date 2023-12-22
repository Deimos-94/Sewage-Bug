extends Node2D
class_name Weapon

#export var damage := 10

#func _init() -> void:
	#collision_layer = 2
	#collision_mask = 0

#func swing():
#	pass

func _on_area_2d_body_entered(body):
	if body is Maggot:
		body.takeDamage()
