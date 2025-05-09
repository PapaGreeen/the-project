extends CharacterBody2D

@export var sneak_speed: float = 100.0
@export var walk_speed: float = 300.0
@export var sprint_speed: float = 600.0
@export var starting_health: int = 5

@onready var sprite = $Sprite2D

# Preload each direction sprite
var sprite_up = preload("res://assets/sprites/player/idle_up.png")
var sprite_down = preload("res://assets/sprites/player/idle_down.png")
var sprite_left = preload("res://assets/sprites/player/idle_left.png")
var sprite_right = preload("res://assets/sprites/player/idle_right.png")

# default facing
var last_direction = "down"


# Player movement
func _physics_process(_delta):
	var move_speed = walk_speed

	if Input.is_action_pressed("sprint"):
		move_speed = sprint_speed

	if Input.is_action_pressed("crouch"):
		move_speed = sneak_speed

	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	if input_vector.length() > 0:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				sprite.texture = sprite_right
			else:
				sprite.texture = sprite_left
		else:
			if input_vector.y > 0:
				sprite.texture = sprite_down
			else:
				sprite.texture = sprite_up

	velocity = input_vector * move_speed
	move_and_slide()

	if input_vector.length() > 0:
		print("Player Moving: ", global_position, " | Speed: ", move_speed)

# Player health
# This will act as the sudo "steahlth" mechanic for now. Ideally, should be handled via states but this will do for now.
var health = starting_health

#
#if health == 0
#	print("Game Over!");
#
