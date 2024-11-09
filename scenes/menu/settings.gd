extends CanvasLayer

@onready var joy = preload("res://scenes/menu/mobile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$settings.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_return_pressed() -> void:
	$menubutton.button_pressed = false


func _on_save_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.

func _on_load_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.

func _on_exitmain_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu/mainmenu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

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
	AudioServer.set_bus_volume_db(0, value)

func _on_mutemaster_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(0, true)
	else:
		AudioServer.set_bus_mute(0, false) 


func _on_musicvolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, value)


func _on_mutemusic_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(1, true)
	else:
		AudioServer.set_bus_mute(1, false) 


func _on_sf_xvolume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, value)


func _on_mutesfx_toggled(toggled_on: bool) -> void:
	if toggled_on:
		AudioServer.set_bus_mute(2, true)
	else:
		AudioServer.set_bus_mute(2, false) 


func _on_device_item_selected(index: int) -> void:
	match index:
		0:
			$settings/optionbar/CONTROL/mouseaim.button_pressed= false
			$settings/optionbar/CONTROL/joystick.button_pressed= true
		1:
			$settings/optionbar/CONTROL/mouseaim.button_pressed= true
			$settings/optionbar/CONTROL/joystick.button_pressed= false

func _on_menubutton_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$settings.visible = true
	else:
		$settings.visible = false
		

func _on_mouseaim_toggled(toggled_on: bool) -> void:
	global.settings["mouseaim"]=toggled_on


func _on_debug_toggled(toggled_on: bool) -> void:
	global.settings["debugmode"]=toggled_on


func _on_joystick_toggled(toggled_on: bool) -> void:
	var joyin = joy.instantiate()
	if toggled_on:
		if get_node_or_null("mobile"):
			print("bluhh")
		else :
			get_node("anchor").add_child(joyin)
	else :
		$anchor/mobile.queue_free()
	global.settings["joystick"]=toggled_on
