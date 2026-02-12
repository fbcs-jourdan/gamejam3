extends Node3D

@export var cameras: Array[Camera3D]
var index := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(cameras[index].fov)
	#cameras[index].fov * Cam.accel_zoom
	if Input.is_action_pressed("accelerate") and cameras[index].fov <= 110:
		cameras[0].fov *= 1.001
		cameras[1].fov *= 1.001
		if Input.is_action_pressed("handbrake") and cameras[index].fov >= 80:
			cameras[0].fov /= 1.005
			cameras[1].fov /= 1.005
	elif cameras[index].fov >= 90:
		cameras[0].fov /= 1.001
		cameras[1].fov /= 1.001
	if Input.is_action_just_pressed("cam"):
		index = (index + 1) % cameras.size()
		change_cam()
		
		
		print("cam working")
		
func change_cam() -> void:
	for i in range(cameras.size()):
		cameras[i].current = (i == index)
		
		pass
