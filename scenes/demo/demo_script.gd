extends Spatial

func _ready():
	# Start exposure at 0.25 to fade in
	$character/camera.environment.tonemap_exposure = 0.25
