extends KinematicBody

export var velocity = Vector3();

func _physics_process(delta):
	if (!is_on_floor()):
		velocity.y -= 9.8 * delta;
	velocity = move_and_slide(velocity, Vector3(0, 1, 0));

func hit(vel):
	velocity = vel * 1.1 + Vector3(0, 3, 0);