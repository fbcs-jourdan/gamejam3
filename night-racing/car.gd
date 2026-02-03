extends Node3D

@onready var ball = $Ball
@onready var car_model: Node3D = $CarModel
@onready var front_left: MeshInstance3D = $"CarModel/sedan-sports/wheel-front-left"
@onready var front_right: MeshInstance3D = $"CarModel/sedan-sports/wheel-front-right"
@onready var body: MeshInstance3D = $"CarModel/sedan-sports/body"



var acceleration = 70.0
var steering = 12.0
var turn_speed = 5
var body_tilt = 30

var speed_input = 0
var rotate_input = 0

func _physics_process(_delta):
	car_model.transform.origin = ball.transform.origin
	ball.apply_central_force(-car_model.global_transform.basis.z * speed_input)
	
func _process(delta):
	speed_input = (Input.get_action_strength("accelerate")) - (Input.get_action_strength("brake")) * acceleration
	rotate_input = deg_to_rad(steering) * (Input.get_action_strength("left")) - (Input.get_action_strength("right"))
	front_right.rotation.y = rotate_input
	front_left.rotation.y = rotate_input
	
	if ball.linear_velocity.length() > 0.75:
		RotateCar(delta)
	
func RotateCar(delta):
	var new_basis = car_model.global_transform.basis.rotated(car_model.global_transform.basis.y, rotate_input)
	car_model.global_transform.basis = car_model.global_transform.basis.slerp(new_basis, turn_speed * delta)
	car_model.global_transform = car_model.global_transform.orthonormalized()
	var t = -rotate_input * ball.linear_velocity.length() / body_tilt
	body.rotation.z = lerp(body.rotation.z, t, 10 * delta)
