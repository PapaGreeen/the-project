extends CharacterBody2D

@export var sneak_speed: float = 300.0
@export var sprint_speed: float = 600.0

func _physics_process(delta):
    var move_speed = sneak_speed

    if Input.is_action_pressed("sprint"):
        move_speed = sprint_speed

    var input_vector = Vector2(
        Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
        Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    ).normalized()

    velocity = input_vector * move_speed
    move_and_slide()

    if input_vector.length() > 0:
        print("Player Moving: ", global_position, " | Speed: ", move_speed)
