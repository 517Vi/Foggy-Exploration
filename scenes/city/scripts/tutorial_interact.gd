extends Sprite3D

func _ready():
	$"../interact_zone".connect("interact", self, "queue_free")
