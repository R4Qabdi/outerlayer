extends CanvasLayer

func _process(_delta: float) -> void:
	#print("waho")
	pass


func _on_e_pressed() -> void:
	Input.action_press("interact")
	Input.action_release("interact")


func _on_auto_toggled(toggled_on: bool) -> void:
	if toggled_on:
		global.settings["auto"]=true
	else:
		global.settings["auto"]=false
