extends CanvasLayer




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu.tscn")


func _on_button_2_pressed() -> void:
	$Control/Panel/PanelContainer.visible = true


func _on_x_pressed() -> void:
	$Control/Panel/PanelContainer.visible = false
