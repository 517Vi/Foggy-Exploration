extends Area

export var lamp_number: int
export var lit = false
export var particle_lifetime = 0.5

signal interact

func _ready():
	$lit_elem.visible = lit
	$lit_elem/fire.lifetime = particle_lifetime

func on_interact():
	if not lit:
		lit = true
		$"..".puzzle_num(lamp_number)
		$lit_elem.show()

func extinguish():
	lit = false
	$lit_elem.hide()
