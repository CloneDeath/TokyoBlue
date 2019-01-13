extends Spatial

var Racer = preload("res://Racers/Racer.tscn");

export(NodePath) var playerPath;

func get_player():
	return self.get_node(playerPath);

func _process(delta):
	var x = rand_range(0, 0.1);
	if (x > delta): return;
	var player = get_player();
	if (player == null): return;
	var racer = Racer.instance();
	var dx = rand_range(-10, 10);
	racer.translation = player.translation + Vector3(dx, 0, 100);
	var dv = rand_range(0.5, 0.9);
	racer.velocity.z = player.velocity.z * dv;
	add_child(racer);
