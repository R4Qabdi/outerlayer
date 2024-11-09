extends AnimatedSprite2D

@onready var peluru = preload("res://scenes/instantiate/character/peluru_1.tscn")


func _on_player_serang() -> void:
	var pelor = peluru.instantiate()
	pelor.position = global_position
	pelor.rotation = global_rotation
	get_parent().get_parent().get_parent().add_child(pelor)
