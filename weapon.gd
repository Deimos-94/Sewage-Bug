class_name weapon
extends Node2D

#export var damage := 10

#func _init() -> void:
	#collision_layer = 2
	#collision_mask = 0


func _on_area_2d_body_entered(body):
	if body is Enemy:
		body.takeDamage()