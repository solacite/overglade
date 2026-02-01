extends Control
@onready var animPlayer = $"../../AudioStreamPlayer2D"


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/happy.tscn")


func _on_credits_pressed() -> void:
	animPlayer.play("slide_in")


func _on_quit_pressed() -> void:
	get_tree().quit()
