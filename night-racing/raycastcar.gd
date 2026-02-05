extends RigidBody3D

@export var wheels: Array[RaycastWheel]
@export var acceleration := 600.0
@export var max_speed := 20.0

var motor_input := 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("accelerate"):
		motor_input = 1
	elif event.is_action_released("accelerate"):
		motor_input = 0
		
	if event.is_action_pressed("brake"):
		motor_input = -1
	elif event.is_action_released("brake"):
		motor_input = 0

func _physics_process(delta: float) -> void:
	for wheel in wheels:
		_do_single_wheel_suspension(wheel)
		_do_single_wheel_acceleration(wheel)
		
func _get_point_velocity(point: Vector3) -> Vector3:
	return linear_velocity + angular_velocity.cross(point - global_position)
	
func _do_single_wheel_acceleration(ray: RaycastWheel) -> void:
	var forward_dir := -ray.global_basis.z
	var vel := forward_dir.dot(linear_velocity)
	
	# wheel_surface = 2 * pi * r
	ray.wheel.rotate_x(-vel * get_physics_process_delta_time() * 2  * PI * ray.wheel_radius)
		
	if ray.is_colliding() and ray.is_motor and motor_input:	
		var contact := ray.wheel.global_position
		var force_vector := forward_dir * acceleration * motor_input
		var force_pos := contact - global_position
		
		if vel > max_speed:
			
			force_vector = force_vector * 0.1
			
		apply_force(force_vector, force_pos)

func _do_single_wheel_suspension(ray: RaycastWheel) -> void:
	if ray.is_colliding():
		ray.target_position.y = -(ray.rest_dist + ray.wheel_radius + ray.over_extend)
		var contact := ray.get_collision_point()
		var spring_up_dir := ray.global_transform.basis.y
		var spring_len := ray.global_position.distance_to(contact) - ray.wheel_radius
		var offset := ray.rest_dist - spring_len
		
		ray.wheel.position.y = -spring_len
		
		var spring_force := ray.spring_strength * offset
		
		# damping force = damping * relative velocity 
		
		var world_vel := _get_point_velocity(contact)
		var relative_vel := spring_up_dir.dot(world_vel)
		var spring_damp_force := ray.spring_damping * relative_vel
		
		
		var force_vector := (spring_force - spring_damp_force) * spring_up_dir
		
		contact = ray.wheel.global_position
		var force_pos_offset := contact - global_position
		apply_force(force_vector, force_pos_offset)
		
		
