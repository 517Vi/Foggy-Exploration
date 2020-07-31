extends Spatial

export var SOLUTION = [2, 4, 5]
var lit = []
var broken = false

func puzzle_num(num: int):
	if not num in SOLUTION:
		broken = true
	lit.append(num)
	if lit.size() == 3 and not broken:
		$solved.play()
		add_to_group("solved")
	elif lit.size() >= 5:
		lit = []
		broken = false
		extinguish_lamps()

func extinguish_lamps():
	# Wait 1 second before extinguishing
	yield(get_tree().create_timer(0.5), "timeout")
	for child in get_children():
		if child is Area:
			child.extinguish()
