extends StaticBody

export var REFILL_RATE = 10
export var lit = false

var chr

func _ready():
	$light.visible = lit
	chr = get_tree().get_nodes_in_group("player")[0]
	if lit:
		$interact_zone.remove_from_group("interactable")

func _process(delta):
	if lit and $interact_zone.overlaps_body(chr):
		chr.refill(delta*REFILL_RATE)
		chr.last_lamp_post = self.get_path()

func on_interact():
	lit = true
	$light.visible = true
	$interact_zone.remove_from_group("interactable")
