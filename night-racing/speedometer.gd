extends Control

@onready var label: Label = $Label
@onready var texture_rect_2: TextureRect = $TextureRect2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	texture_rect_2.rotation = (SPEED.velocity * 10.5) * delta
