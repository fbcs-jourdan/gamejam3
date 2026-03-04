extends Node2D

@onready var easy: Button = $easy
@onready var hard: Button = $hard
@onready var medium: Button = $medium

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_easy_pressed() -> void:
	point.easy = true

func _on_medium_pressed() -> void:
	point.medium = true

func _on_hard_pressed() -> void:
	point.hard = true
