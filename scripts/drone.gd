extends Node2D

const SPEED = 60
var velocity = Vector2.RIGHT  # Initial direction: right

@onready var ray_north = $RayCastNorth
@onready var ray_east = $RayCastEast
@onready var ray_south = $RayCastSouth
@onready var ray_west = $RayCastWest

func _process(delta: float) -> void:
	if ray_north.is_colliding():
		velocity = Vector2.DOWN
	elif ray_east.is_colliding():
		velocity = Vector2.LEFT
	elif ray_south.is_colliding():
		velocity = Vector2.UP
	elif ray_west.is_colliding():
		velocity = Vector2.RIGHT

	position += velocity * SPEED * delta
