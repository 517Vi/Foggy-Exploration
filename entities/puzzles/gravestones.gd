extends Spatial

export var SOLUTION = [2, 4, 5]
var lit = []
var broken = false
var solved = false

func light(num: int):
	if solved:
		return false
	if not num in SOLUTION:
		broken = true
	lit.append(num)
	if lit.size() == 3 and not broken:
		$solved.play()
		add_to_group("solved")
		solved = true
	elif lit.size() >= 5:
		lit = []
		broken = false
		extinguish_lamps()
	return true

func extinguish_lamps():
	if solved:
		return
	# Wait 1 second before extinguishing
	yield(get_tree().create_timer(0.5), "timeout")
	for child in get_children():
		if child is Area:
			child.extinguish()
