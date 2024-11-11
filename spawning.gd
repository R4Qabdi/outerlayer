extends AnimatedSprite2D

@onready var klinci = preload("res://scenes/instantiate/character/mob.tscn") 
@onready var klincibuf = preload("res://scenes/instantiate/character/mob.tscn")


func _ready() -> void:
	play("default")

func _on_animation_finished() -> void:
	var klinciins = klinci.instantiate()
	klinciins.global_position = global_position
	#print("keluarlah kelinci")
	get_parent().add_child(klinciins)
	queue_free()
