extends Spatial

func _process(_delta):
	$TrackDirector.set_focus($Player.translation);