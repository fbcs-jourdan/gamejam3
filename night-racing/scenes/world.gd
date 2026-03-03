extends Node3D

@onready var arrow: MeshInstance3D = $Car/Arrow
@onready var delivery_zone: Area3D = $DeliveryZone
@onready var car: RigidBody3D = $Car
var health = 100
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer

var music_start = false
@onready var engine: AudioStreamPlayer = $engine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#audio_stream_player.play_sfx("idle_sound")
	engine.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#arrow.rotation.y = arrow.global_position.angle_to(delivery_zone.global_position) + PI
	##arrow.look_at_from_position(arrow.global_position, delivery_zone.global_position)
	#print(delivery_zone.global_position)
	#print(car.global_position)
	
	
	if Input.is_action_just_pressed("handbrake"):
		audio_stream_player.play_sfx("drift")
	if Input.is_action_just_pressed("radio"):
		audio_stream_player.play_sfx("click")
		timer.start()
		if music_start:
			audio_stream_player.play_sfx("radio_music")
			
	if Input.is_action_pressed("accelerate"):
		if engine.pitch_scale <= 3:
			engine.pitch_scale += .05
		
	elif engine.pitch_scale >= 1:
		engine.pitch_scale -= .05
	
	
	#print(health)
	if point.health <= 0:
		get_tree().quit()
	pass
	


func _on_delivery_zone_body_entered(body: Node3D) -> void:
	get_tree().reload_current_scene()

func _on_car_body_entered(body: Node) -> void:
	audio_stream_player.play_sfx("crash_sound")
	#health -= 10
	point.score = 0
	point.health -= 10

func _on_timer_timeout() -> void:
	music_start = true
