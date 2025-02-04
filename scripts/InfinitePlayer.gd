extends CharacterBody2D

var speed = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		get_parent().get_node("AudioStreamPlayer/Sound effects/jump").play()

	velocity.x = speed
	move_and_slide()

func hit():
	$AnimatedSprite2D.play("crash")
	get_parent().get_node("AudioStreamPlayer/Sound effects/crash").play()
