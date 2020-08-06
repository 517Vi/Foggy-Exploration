extends Spatial

export var SOLUTION = [2, 3, 1]
var pattern = []

func light(num: int):
	pattern.append(num)
	if pattern == SOLUTION:
		$solved.play()
		add_to_group("solved")
		get_tree().get_nodes_in_group("hud")[0].show_element("earth")
	elif pattern.size() >= 3:
		pattern = []
		extinguish_lamps()
	return true

func extinguish_lamps():
	# Wait 1 second before extinguishing
	yield(get_tree().create_timer(0.5), "timeout")
	for child in get_children():
		if child is Area:
			child.extinguish()
