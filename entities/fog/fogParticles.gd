extends Particles

export(float, 0, 1) var quality = 1

func _ready():
	set_quality(quality)

func set_quality(qual):
	quality = qual
	amount = 300 + quality*2700
	draw_pass_1.surface_get_material(0).albedo_color.a = 0.7 - 0.5*quality
