extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused= false
	$Control/optionbar.visible = false
	$Control/PanelContainer.visible = false

func _on_option_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Control/optionbar.visible = true
	else:
		$Control/optionbar.visible = false


func _on_about_toggled(toggled_on: bool) -> void:
	if toggled_on : 
		$Control/PanelContainer.visible = true
	else : 
		$Control/PanelContainer.visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/tutorial.tscn")

##OPTION BAR

#graphics
func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_resolution_item_selected(index: int) -> void:
	match index :
		0:
			DisplayServer.window_set_size(Vector2i(480,640))
		1:
			DisplayServer.window_set_size(Vector2i(720,1280))
		2:
			DisplayServer.window_set_size(Vector2i(1080,1920))

func _on_viewport_item_selected(index: int) -> void:
	match index :
		0:
			get_window().content_scale_size = Vector2i(640,480)
		1:
			get_window().content_scale_size = Vector2i(1280,720)
		2:
			get_window().content_scale_size = Vector2i(1920,1080)

#volume
func _on_mastervolume_value_changed(value: float) -> void:
	
	if value == -6 : 
		$Control/optionbar/VOLUME/Mastervolume/mutemaster.button_pressed=true
	else:
		$Control/optionbar/VOLUME/Mastervolume/mutemaster.button_pressed=false
		AudioServer.set_bus_volume_db(0, value)

func _on_mutemaster_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false) 


func _on_musicvolume_value_changed(value: float) -> void:
	if value == -6 : 
		$Control/optionbar/VOLUME/Musicvolume/mutemusic.button_pressed=true
	else:
		$Control/optionbar/VOLUME/Musicvolume/mutemusic.button_pressed=false
		AudioServer.set_bus_volume_db(1, value)


func _on_mutemusic_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false) 


func _on_sf_xvolume_value_changed(value: float) -> void:
	if value == -6 : 
		$Control/optionbar/VOLUME/SFXvolume/mutesfx.button_pressed=true
	else:
		$Control/optionbar/VOLUME/SFXvolume/mutesfx.button_pressed=false
		AudioServer.set_bus_volume_db(2, value)


func _on_mutesfx_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false) 


func _on_device_item_selected(index: int) -> void:
	match index:
		0:
			pass
		1:
			pass
