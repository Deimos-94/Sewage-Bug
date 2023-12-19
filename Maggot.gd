extends CharacterBody2D
class_name Enemy


const SPEED = 300.0
var direction = 0
var health = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func takeDamage():
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = move_toward(velocity.x, direction, SPEED)

	move_and_slide()
