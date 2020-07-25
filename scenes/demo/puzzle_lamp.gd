extends Area

export var lamp_number: int
export var lit = false

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact") and overlaps_body($"../character"):
		emit_signal("puzzle_num", lamp_number)
