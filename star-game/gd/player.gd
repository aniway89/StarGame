
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -850.0
const GRAVITY = 1400.0

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump with Space or W
	if (Input.is_key_pressed(KEY_SPACE) or Input.is_key_pressed(KEY_W)) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Move with arrow keys or A/D
	var direction := Input.get_axis("ui_left", "ui_right")

	if Input.is_key_pressed(KEY_A):
		direction -= 1.0
	if Input.is_key_pressed(KEY_D):
		direction += 1.0

	direction = clampf(direction, -1.0, 1.0)
	velocity.x = direction * SPEED

	# Face the movement direction
	if direction != 0.0:
		player_sprite.flip_h = direction < 0.0

	# Choose animation based on movement
	if not is_on_floor():
		if velocity.y < 0.0:
			play_animation("jump")
		#else:
			#play_animation("fall")
	elif absf(velocity.x) > 0.0:
		play_animation("run")
	else:
		play_animation("idle")

	move_and_slide()


func play_animation(animation_name: String) -> void:
	if player_sprite.animation != animation_name:
		player_sprite.play(animation_name)
