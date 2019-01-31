extends KinematicBody

export var velocity = Vector3();
var THRUST = 5;
var maxSpeed = (1000.0 / 60 / 60) * 1000;
var drift = 0;
var DRIFT_MAX = 10;
var DRIFT_ACCEL = 0.1;

func _process(_delta):
	$AnimationPlayer.play("yaw");
	$AnimationPlayer.seek((-drift/2.0) + 0.5);

func _physics_process(delta):
	UpdateThrust(delta);
	UpdateInput(delta);
	UpdateGravity(delta);

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

func UpdateInput(delta):
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");
	var desire = (int(LEFT) - int(RIGHT));
	var drift_acceleration = DRIFT_ACCEL * delta * 60;
	drift = desire * drift_acceleration + drift * (1 - drift_acceleration);
	velocity.x = drift * DRIFT_MAX;