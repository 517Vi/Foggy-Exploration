extends AudioStreamPlayer

export(Array, AudioStream) var clips

func _ready():
	#warning-ignore:return_value_discarded
	connect("finished", self, "randomize_clip")
	randomize_clip()

func randomize_clip():
	# Randomize the clip played
	stream = clips[randi() % clips.size()]
