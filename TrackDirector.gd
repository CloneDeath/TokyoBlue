extends Spatial
var Track = preload("res://Environment/Track/Track.tscn");

var loaded = Vector3();
var focus = Vector3();
export var LoadDistance = 100;

func set_focus(new_focus):
	focus = new_focus;

func load_track():
	var t = Track.instance();
	t.translation = loaded;
	loaded += Vector3(0, 0, 20)
	add_child(t);

func _process(_detla):
	while (loaded.z < focus.z + LoadDistance):
		load_track();
	for track in get_children():
		consider_removing(track);

func consider_removing(track):
	if (track.translation.z < focus.z - LoadDistance):
		track.queue_free();