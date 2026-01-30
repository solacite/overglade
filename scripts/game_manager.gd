extends Node

var sprite: Sprite2D

func change_sprite(texture_path: String):
	if sprite:
		sprite.texture = load(texture_path)
