extends KinematicBody

export var velocity = Vector3();

func _physics_process(delta):
	#velocity.y -= 9.8 * delta;
	velocity = move_and_slide(velocity);