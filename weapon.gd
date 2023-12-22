extends Node2D
class_name Weapon


#export var damage := 10



func _on_area_2d_body_entered(body):
	if body is Maggot:
		body.takeDamage()
