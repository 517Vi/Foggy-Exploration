extends Spatial

func _ready():
	gen_colliders(self)

func gen_colliders(node):
	# Create trimesh collider for each meshinstance child if it's not hidden
	if not node.visible:
		return
	elif node is MeshInstance:
		node.create_trimesh_collision()
	else:
		for child in node.get_children():
			gen_colliders(child)
