extends KinematicBody

var THRUST = 10;
var velocity = Vector3();
var maxSpeed = (1000.0 / 60 / 60) * 1000;

func _physics_process(delta):
	velocity.z += THRUST * delta;
	if (velocity.z > maxSpeed): velocity.z = maxSpeed;
	UpdateInput();
	velocity = self.move_and_slide(velocity);

func UpdateInput():
	var LEFT = Input.is_action_pressed("move_left");
	var RIGHT = Input.is_action_pressed("move_right");
	velocity.x = (int(LEFT) - int(RIGHT)) * 10;