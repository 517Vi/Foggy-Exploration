extends Area

export var lamp_number: int
export var lit = false

signal interact

func _ready():
	$lit_elem.visible = lit

func on_interact():
	if not lit:
		lit = true
		$"..".puzzle_num(lamp_number)
		$lit_elem.show()

func extinguish():
	lit = false
	$lit_elem.hide()
