extends StaticBody

export(String) var npc_name
export(Script) var dialog_script

var scr
var hud

func _ready():
	if dialog_script:
		scr = dialog_script.new()
	if get_tree().get_nodes_in_group("hud").size() > 0:
		hud = get_tree().get_nodes_in_group("hud")[0]

func on_interact():
	if not scr:
		return
	var text = scr.next()
	hud.set_dialog(text)
	
