extends Control

func set_location(loc):
	$location.text = loc

func set_fuel(fuel):
	$fuel_indicator.value = fuel

func set_dialog(text):
	$dialog.text = text
	$dialog/Timer.start()
	
func _dialog_timeout():
	$dialog.text = ""
