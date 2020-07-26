extends Area

export var lamp_number: int
export var lit = false

func _ready():
	$lit_elem.visible = lit

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact") and overlaps_body($"/root/city/character") and not lit:
		lit = true
		$"..".puzzle_num(lamp_number)
		$lit_elem.show()

func extinguish():
	lit = false
	$lit_elem.hide()
