extends AudioStreamPlayer


	
#var idle_sound = preload("res://assets/🔈 Dodge Challenger III - 3 Hours Engine V8 Idle Sound _ ASMR, Study, Relax, Reduce Stress, Sleep 🔈 [hv048rlmfLw] (1).mp3")

# Called when the node enters the scene tree for the first time.
func play_sfx(sfx_name : String):
	var stream = null

	#if sfx_name == "idle_sound":
		#stream = idle_sound

	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()
