extends CharacterBody2D
class_name Maggot


const SPEED = 300.0
var health = 1
var is_moving_left = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func detect_ledge():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x
		
func move():
	if is_moving_left:
		velocity.x = move_toward(velocity.x, -SPEED, SPEED)
	else:
		velocity.x = move_toward(velocity.x, SPEED, SPEED)

func takeDamage():
	health -= 1
	if health <= 0:
		queue_free()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	detect_ledge()
	move()
	move_and_slide()
