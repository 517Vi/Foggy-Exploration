extends StaticBody

export var REFILL_RATE = 10
export var lit = false

var chr

func _ready():
	$light.visible = lit
	chr = $"/root/city/character"

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact") \
		and $interact_zone.overlaps_body(chr):
		lit = true
		$light.visible = true

func _process(delta):
	if lit and $interact_zone.overlaps_body(chr):
		chr.refill(delta*REFILL_RATE)
		chr.last_lamp_post = self.get_path()
