extends StaticBody

export(Mesh) var mesh
export(Script) var dialog_script

func _ready():
	if mesh:
		$mesh.mesh = mesh

func on_interact():
	print("Hello!")
