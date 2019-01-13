extends Control

export(NodePath) var player;

func get_player():
	return get_node(player);

func _process(delta):
	var velocity = get_player().velocity.z;
	$SpeedValue.text = str(velocity * 60 * 60 / 1000) + " kph";