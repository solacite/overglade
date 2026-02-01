extends Camera2D

var max_offset = Vector2(20, 20)
var trauma = 0.4

func _ready() -> void:
	set_process(true)

func _process(delta):
	shake()

func shake():
	offset.x = randf_range(-max_offset.x, max_offset.x) * trauma
	offset.y = randf_range(-max_offset.y, max_offset.y) * trauma
