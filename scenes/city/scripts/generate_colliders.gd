extends Spatial

func _ready():
	gen_colliders(self)

func gen_colliders(node):
	# Create trimesh collider for each meshinstance child if it's not hidden
	if not node.get("visible"):
		return
	elif node is MeshInstance:
		# Skip if already has a static body
		for child in node.get_children():
			if child is StaticBody:
				return
		node.create_trimesh_collision()
		var coll
		for child in node.get_children():
			if child is StaticBody:
				coll = child
				break
		for group in node.get_groups():
			coll.add_to_group(group)
	else:
		for child in node.get_children():
			gen_colliders(child)
