extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_north = $RayCastNorth
@onready var ray_cast_east = $RayCastEast
@onready var ray_cast_south = $RayCastSouth
@onready var ray_cast_west = $RayCastWest

# Called every frame. This acts as the "movement" for the drone.
func _process(delta: float) -> void:
	if ray_cast_north.is.colliding():
		direction = 1
	if ray_cast_east.is.colliding():
			direction = -1
	if ray_cast_south.is.colliding():
			direction = -1
	if ray_cast_west.is.colliding():
			direction = 1
		
	position.x += direction + SPEED * delta
	position.y += direction + SPEED * delta
