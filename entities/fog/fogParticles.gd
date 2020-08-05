extends Particles

export(float, 0, 1) var quality = 1

func _ready():
	amount = 300 + quality*2700
	draw_pass_1.surface_get_material(0).albedo_color.a = 1 - 0.8*quality
