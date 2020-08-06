extends Spatial

export var SOLUTION = [1, 2, 3, 4, 5, 8, 9, 12, 13, 14, 15, 16]
var lit = []
var broken = false
var solved = false

func light(num: int):
	if solved:
		return false
	if not num in SOLUTION:
		broken = true
	lit.append(num)
	if lit.size() == 12 and not broken:
		$solved.play()
		add_to_group("solved")
		get_tree().get_nodes_in_group("hud")[0].show_element("water")
		solved = true
	elif lit.size() >= 12:
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
