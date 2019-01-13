extends Spatial

var Racer = preload("res://Racers/Racer.tscn");

export(NodePath) var playerPath;
export var LoadDistance = 100;

func get_player():
	return self.get_node(playerPath);

func add_enemy():
	var player = get_player();
	var racer = Racer.instance();
	var dx = rand_range(-10, 10);
	racer.translation = Vector3(dx, 0, player.translation.z + LoadDistance);
	var dv = rand_range(0.5, 0.9);
	racer.velocity.z = player.velocity.z * dv;
	add_child(racer);

func _process(delta):
	var x = rand_range(0, 0.1);
	if (x <= delta):
		add_enemy();
	cull_passed_children();

func cull_passed_children():
	var player = get_player();
	for child in get_children():
		if (child.translation.z < player.translation.z - LoadDistance):
			child.queue_free();

