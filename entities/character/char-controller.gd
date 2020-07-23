extends KinematicBody

export var SPEED = 200
export var ORBIT_SPEED = 1

func _physics_process(delta):
	## Camera movement ##
	# Original camera position
	var cam_pos = $camera.translation
	# Rotate the position about the origin
	if Input.is_action_pressed("orbit_left"):
		cam_pos = cam_pos.rotated(Vector3.UP, ORBIT_SPEED*delta)
	if Input.is_action_pressed("orbit_right"):
		cam_pos = cam_pos.rotated(Vector3.UP, -ORBIT_SPEED*delta)
	# Set new position
	$camera.translation = cam_pos
	# Point at character
	$camera.look_at(self.translation, Vector3.UP)
	## Character movement ##
	# Direction camera is pointing, without Y
	var facing = -$camera.transform.basis.z
	facing.y = 0
	facing = facing.normalized()
	# Movement direction vector
	var dir = Vector3.ZERO
	# Add movement directions to direction vector
	# Movement directions calculated from direction camera is pointing
	if Input.is_action_pressed("move_up"):
		dir += facing
	if Input.is_action_pressed("move_down"):
		dir += facing.rotated(Vector3.UP, PI)
	if Input.is_action_pressed("move_left"):
		dir += facing.rotated(Vector3.UP, PI/2)
	if Input.is_action_pressed("move_right"):
		dir += facing.rotated(Vector3.UP, -PI/2)
	# Round vector to 0 if small to account for rounding error in rotation
	if dir.length() < 0.01:
		dir = Vector3.ZERO
	# Normalize vector to get pure direction
	dir = dir.normalized()
	# Move kinematic body and slide against other colliders
	# warning-ignore:return_value_discarded
	self.move_and_slide_with_snap(dir*SPEED*delta, Vector3.DOWN)
	# Make character fall (not realistic gravity)
	# warning-ignore:return_value_discarded
	self.move_and_collide(Vector3.DOWN*10*delta)
	# Rotate character visuals to point in direction moved
	# Smoothed with quaternions
	if dir != Vector3.ZERO:
		# Starting basis quaternion
		var current_quat = Quat($visuals.transform.basis)
		# Target basis quaternion
		var target_quat = Quat(
			$visuals.transform.looking_at(-dir, Vector3.UP).basis)
		# Use spherical linear interpolation between start and target
		$visuals.transform.basis = Basis(current_quat.slerp(target_quat, 0.5))
