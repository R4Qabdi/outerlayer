extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text="score : "+str(global.score)


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/coming_soon.tscn")


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu.tscn")
