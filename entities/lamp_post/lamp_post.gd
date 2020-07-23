extends StaticBody

func _input(ev: InputEvent):
	if ev.is_action_pressed("interact") \
		and $interact_zone.overlaps_body($"../character"):
		# Temporary behavior: toggle light on interact
		$light.visible = !$light.visible
