extends StaticBody

export(Script) var dialog_script

var scr
var hud

func _ready():
	if dialog_script:
		scr = dialog_script.new()
	if get_tree().get_nodes_in_group("hud").size() > 0:
		hud = get_tree().get_nodes_in_group("hud")[0]

func on_interact():
	# If no defined text, just do "..."
	var text = ". . ."
	var has_next = false
	if scr:
		text = scr.next()
		has_next = scr.has_next()
	hud.set_dialog(text, has_next)
	
