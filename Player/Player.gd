extends KinematicBody

export var velocity = Vector3();
var THRUST = 10;
var maxSpeed = (1000.0 / 60 / 60) * 1000;

func _physics_process(delta):
	UpdateThrust(delta);
	UpdateInput();
	UpdateGravity(delta);

	#velocity = self.move_and_slide(velocity, Vector3(0, 1, 0), false, 100, 0.785398, false);
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("hit"):
			collision.collider.hit(velocity)
			velocity *= 0.9;
		else:
			velocity = velocity.slide(collision.normal)

func UpdateGravity(delta):
	if (!is_on_floor()):
		velocity.y -= 9.8 * delta;

func UpdateThrust(delta):
	velocity.z += THRUST * delta;
	if (velocity.z > maxSpeed): velocity.z = maxSpeed;

func UpdateInput():
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");
	velocity.x = (int(LEFT) - int(RIGHT)) * 10;