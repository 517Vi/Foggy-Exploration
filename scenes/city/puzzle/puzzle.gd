extends Spatial

export var SOLUTION = [1, 2, 3, 4]
var pattern = []

func puzzle_num(num: int):
	pattern.append(num)
	if pattern == SOLUTION:
		print("Correct!")
	elif len(pattern) >= 4:
		pattern = []
		extinguish_lamps()

func extinguish_lamps():
	# Wait 1 second before extinguishing
	yield(get_tree().create_timer(0.5), "timeout")
	for child in get_children():
		if child is Area:
			child.extinguish()
