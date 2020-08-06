tool
extends EditorScript

var prefix = "res://scenes/city/materials/"
var assoc = [
	["stone", "building_wall.tres"],
	["wood", "building_wood.tres"],
	["woodDark", "building_wood_dark.tres"]
]

func _run():
	for mesh in get_scene().get_children():
		if mesh is MeshInstance:
			for surf in range(mesh.mesh.get_surface_count()):
				for pair in assoc:
					if mesh.mesh.surface_get_material(surf).resource_name.split(".")[0] == pair[0]:
						mesh.set_surface_material(surf, load(prefix + pair[1]))
						break
