extends Spatial

func _ready():
	# Create colliders for buildings
	gen_colliders(self)

func gen_colliders(node):
	if node is MeshInstance:
		node.create_convex_collision()
	else:
		for child in node.get_children():
			gen_colliders(child)
