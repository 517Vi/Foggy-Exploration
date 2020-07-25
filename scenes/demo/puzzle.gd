extends Spatial

export var SOLUTION = [1, 2, 3, 4]
var pattern = []

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact"):
		var chr = $"../character"
		if $lamp1.overlaps_body(chr):
			pattern.append(1)
		elif $lamp2.overlaps_body(chr):
			pattern.append(2)
		elif $lamp3.overlaps_body(chr):
			pattern.append(3)
		elif $lamp4.overlaps_body(chr):
			pattern.append(4)
		if pattern == SOLUTION:
			print("Correct!")
		elif len(pattern) > 4:
			pattern = []
