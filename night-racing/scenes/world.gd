extends Node3D

@onready var arrow: MeshInstance3D = $Car/Arrow
@onready var delivery_zone: Area3D = $DeliveryZone
@onready var car: RigidBody3D = $Car

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	arrow.rotation.y = arrow.global_position.angle_to(delivery_zone.global_position) + PI
	#arrow.look_at_from_position(arrow.global_position, delivery_zone.global_position)
	print(delivery_zone.global_position)
	print(car.global_position)
	


func _on_delivery_zone_body_entered(body: Node3D) -> void:
	get_tree().reload_current_scene()
