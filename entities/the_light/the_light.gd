extends Area

export(String, FILE) var target_scene

var player: KinematicBody

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]

func _process(delta):
	if overlaps_body(player):
		var dist = player.global_transform.origin.distance_to(global_transform.origin)
		var diff = $CollisionShape.shape.radius - dist
		player.get_node("hud").set_fade_to_white(diff/6)
		if $game_win.overlaps_body(player):
			get_tree().change_scene(target_scene)
