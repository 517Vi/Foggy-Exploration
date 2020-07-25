extends StaticBody

export var REFILL_RATE = 10
export var lit = false

func _ready():
	$light.visible = lit

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact") \
		and $interact_zone.overlaps_body($"../character"):
		# Temporary behavior: enable light on interact
		lit = true
		$light.visible = true

func _process(delta):
	if lit and $interact_zone.overlaps_body($"../character"):
		$"../character".refill(delta*REFILL_RATE)
		$"../character".last_lamp_post = self.get_path()
