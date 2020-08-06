extends Control

func set_location(loc):
	$location.text = loc

func set_fuel(fuel):
	$fuel_indicator.value = fuel

func set_dialog(text, has_next):
	$dialog.text = text
	$dialog/Timer.start()
	$dialog/has_next.visible = has_next
	call_deferred("update_has_next_prompt") # size only updates after a frame

func set_fade_to_white(amount):
	$fade_to_white.color.a = max(min(amount, 1), 0)
	
func _dialog_timeout():
	$dialog.text = ""
	$dialog/has_next.hide()

func update_has_next_prompt():
	$dialog/has_next.rect_position.x = $dialog.get_combined_minimum_size().x + 15

func show_element(el):
	match el:
		"fire":
			$elements/fire.show()
		"water":
			$elements/water.show()
		"earth":
			$elements/earth.show()
		"wind":
			$elements/wind.show()
