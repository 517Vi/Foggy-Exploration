extends Spatial

func _ready():
	gen_colliders(self)

func gen_colliders(node):
	# Create trimesh collider for each meshinstance child
	if node is MeshInstance:
		node.create_trimesh_collision()
	else:
		for child in node.get_children():
			gen_colliders(child)
