extends MeshInstance

export var puzzles = 3

func _process(delta):
	if get_tree().get_nodes_in_group("solved").size() >= puzzles:
		$open.play()
		queue_free()
