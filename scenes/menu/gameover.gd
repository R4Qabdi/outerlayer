extends CanvasLayer


func _on_tryagain_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/tutorial.tscn")


func _on_main_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu.tscn")
