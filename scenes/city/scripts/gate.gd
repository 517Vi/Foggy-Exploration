extends MeshInstance

export var puzzles = 4
var open = false

func _process(delta):
	if get_tree().get_nodes_in_group("solved").size() >= puzzles and not open:
		# Open
		global_rotate(Vector3.UP, -PI/2)
		open = true
		# Play opening noise
		$gate_open.play()
		# Show "The Light"
		get_tree().get_nodes_in_group("the_light")[0].show()
		# Change gate npc dialog
		var gate_npc = get_tree().get_nodes_in_group("gate_npc")[0]
		gate_npc.scr.speech = gate_npc.scr.after_complete
		gate_npc.scr.i = 0
		
