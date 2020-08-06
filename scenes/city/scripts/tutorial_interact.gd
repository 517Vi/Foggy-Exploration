extends Sprite3D

func _ready():
	if $"../interact_zone":
		$"../interact_zone".connect("interact", self, "queue_free")

func _process(delta):
	if $"..".is_in_group("solved"):
		queue_free()
