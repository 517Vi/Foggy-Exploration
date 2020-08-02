extends Spatial

export var SOLUTION = [1, 2, 3, 4, 5, 6]
var pattern = []

func light(num: int):
	pattern.append(num)
	if pattern == SOLUTION:
		$solved.play()
		add_to_group("solved")
	elif pattern.size() >= 6:
		pattern = []
		extinguish_lamps()
	return true

func extinguish_lamps():
	# Wait 1 second before extinguishing
	yield(get_tree().create_timer(0.5), "timeout")
	for child in get_children():
		if child is Area:
			child.extinguish()
