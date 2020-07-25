extends Spatial

export var SOLUTION = [1, 2, 3, 4]
var pattern = []

func puzzle_num(num: int):
	pattern.append(num)
	if pattern == SOLUTION:
		print("Correct!")
	elif len(pattern) > 4:
		pattern = []

func extinguish_lamps():
	for child in get_children():
		if child.is_type(Area):
			child.get_node("light").hide()
