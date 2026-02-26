extends AudioStreamPlayer

var drift = preload("res://assets/car-tire-skid-screech-sound-effect_oF8B1rNy.mp3")
var radio_click = preload("res://assets/click-sound-effect_gS2qWKNu.mp3")
var radio_music = preload("res://assets/Rust Fishing Village Music in good quality.mp3")

# Called when the node enters the scene tree for the first time.
func play_sfx(sfx_name : String):
	var stream = null
	
	if sfx_name == "drift":
		stream = drift
	if sfx_name == "radio_click":
		stream = radio_click
	if sfx_name == "radio_music":
		stream = radio_music
		

	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()
