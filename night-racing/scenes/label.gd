extends Label

@onready var label: Label = $"."
@onready var game_timer: Timer = $"../GameTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Time left: " + str(int(game_timer.time_left))
