extends Spatial

func _process(delta):
	$TrackDirector.set_focus($Player.translation);