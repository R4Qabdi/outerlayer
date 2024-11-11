extends AnimatedSprite2D
@export var speed = 500
@export var damage = 10
@onready var duar = preload("res://scenes/instantiate/particles/duar.tscn")

func _ready() -> void:
	play("default")

func _process(delta: float) -> void:
	var direction = Vector2(1,0).rotated(rotation)
	global_position+= direction*delta*speed 

func _on_timer_timeout() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	var ledak = duar.instantiate()
	ledak.position = global_position
	get_parent().get_parent().add_child(ledak)
	
	if body.has_method("take_damage"):
		body.take_damage(damage)
	
	#print("waaaa")
	queue_free()
