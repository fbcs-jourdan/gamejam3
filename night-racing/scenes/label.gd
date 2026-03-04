extends Label

@onready var label: Label = $"."
@onready var game_timer: Timer = $"../GameTimer"
@onready var easy_timer: Timer = $"../EasyTimer"
@onready var medium_timer: Timer = $"../MediumTimer"
@onready var hard_timer: Timer = $"../HardTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if point.easy:
		label.text = "Time left: " + str(int(easy_timer.time_left))
	if point.medium:
		label.text = "Time left: " + str(int(medium_timer.time_left))
	if point.hard:
		label.text = "Time left: " + str(int(hard_timer.time_left))
