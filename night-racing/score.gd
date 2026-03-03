extends Control

@onready var points: Label = $points
@onready var health: Label = $health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	points.text = "Score: " + str(point.score)
	health.text = "Health: " + str(point.health)
	
