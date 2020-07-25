extends KinematicBody

export var SPEED = 4
export var ORBIT_SPEED = 1
export var LIGHT_MAX_TIME = 20
export var light_time = 20


func _process(delta):
	# Decay lantern light
	light_time -= delta
	$visuals/light.light_energy = light_time/LIGHT_MAX_TIME
	if light_time <= 0:
		get_tree().quit()
	# DEBUG: Refill lantern if key pressed
	if Input.is_action_just_pressed("debug_refill_lantern"):
		light_time = LIGHT_MAX_TIME

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
	# Only move if actively moving to avoid sliding down slopes
	if dir != Vector3.ZERO:
		# Move kinematic body and slide against other colliders
		# warning-ignore:return_value_discarded
		var velocity = self.move_and_slide_with_snap(
			dir*SPEED,
			Vector3(0, -10, 0),
			Vector3.UP, # up_direction
			true, # stop_on_slope
			4, # max_slides
			PI/3 # floor_max_angle
		)
		# Move upward at full speed on slopes
		if get_slide_count() > 0:
			var collision = get_slide_collision(0)
			var slope_angle = collision.normal.angle_to(Vector3.UP)
			if slope_angle <= PI/3:
				# Get distance left on move
				var remain_distance = SPEED*delta - velocity.length()*delta
				var new_move = dir.slide(collision.normal).normalized()*remain_distance
				move_and_collide(new_move)
	# Only do "gravity" of not on floor to prevent sliding down slopes
	if not is_on_floor():
		# Make character fall (not realistic gravity)
		# warning-ignore:return_value_discarded
		self.move_and_collide(Vector3.DOWN*0.1)
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

func refill(amount):
	# Refill the lantern by the time given by the lamppost, capped by the max
	light_time = min(light_time + amount, LIGHT_MAX_TIME)


