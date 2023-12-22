extends CharacterBody2D
class_name Player


const SPEED = 750.0
const JUMP_VELOCITY = -1800.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var coyote = false
var coyoteTime = 0.150 # Seconds
var lastFloorContact = 0.0
var jumpBufferMax = 0.5
var jumpBuffer = 0
var hasDoubleJump = 1
var canDoubleJump = 0
var weaponSelect = 0
var direction # -1 (left) to 1 (right)
var is_going_right = true

# The character is facing the momentum. In the air character is facing last pressed button
func updateDirection():
	if is_on_floor():
		if is_going_right:
			if direction < 0:
				if velocity.x < 0:
					scale.x = -1
					is_going_right = false
		else:
			if direction > 0:
				if velocity.x > 0:
					scale.x = -1
					is_going_right = true
	else:
		if is_going_right:
			if direction < 0:
				scale.x = -1
				is_going_right = false
		else:
			if direction > 0:
				scale.x = -1
				is_going_right = true

#func swingWeapon():
#	pass
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Count time since last floor contact
	if is_on_floor():
		lastFloorContact = 0
		canDoubleJump = 1
	else:
		lastFloorContact += delta
	# Jump buffer
	jumpBuffer -= delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and lastFloorContact < coyoteTime:
		velocity.y = JUMP_VELOCITY
		lastFloorContact = 999
	#elif is_on_floor and Input.is_action_just_pressed("Jump") and jumpBuffer > 0:
		#velocity.y = JUMP_VELOCITY
		#lastFloorContact = 999
	elif hasDoubleJump and canDoubleJump and Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_VELOCITY / 2
		canDoubleJump = 0
	else:
		jumpBuffer = jumpBufferMax

	# Get the input direction and handle the movement/deceleration.
	# Accelerating based movement.
	# Weird behavior: moving opposite of momentum makes moving more slippery than not mmoving
	direction = Input.get_axis("Left", "Right")
	if direction:
		#velocity.x = direction * SPEED
		velocity.x = move_toward(velocity.x, direction * SPEED, 40)
	else:
		velocity.x = move_toward(velocity.x, 0, 40)
	
	move_and_slide()
	updateDirection()


