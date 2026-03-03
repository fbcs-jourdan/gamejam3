extends AudioStreamPlayer

var drift = preload("res://assets/car-tire-skid-screech-sound-effect_oF8B1rNy.mp3")
var radio_click = preload("res://assets/click-sound-effect_gS2qWKNu.mp3")
var crash_sound = preload("res://assets/loud-crash-sound-effect_B9h2X6zz.mp3")
var radio_music = preload("res://assets/Rust Fishing Village Music in good quality (trimmed).mp3")

#func _ready() -> void:
	#set_volume_db(-20)

# Called when the node enters the scene tree for the first time.
func play_sfx(sfx_name : String):
	var stream = null
	if sfx_name == "drift":
		stream = drift
	if sfx_name == "radio_music":
		stream = radio_music
	if sfx_name == "crash_sound":
		
		stream = crash_sound
	#if sfx_name == "idle_sound":
		#stream = idle_sound
		#volume_db -= -20

	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()
