extends Control


var scene_to_load


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu/CenterRow/Buttons/NewGameButton.grab_focus()
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	self.scene_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	#warning-ignore:return_value_discarded
	get_tree().change_scene_to(scene_to_load)
