extends Node2D
@onready var spawner = preload("res://scenes/instantiate/spawning.tscn")
@onready var victory = preload("res://scenes/menu/uivictory.tscn")
@onready var lose = preload("res://scenes/menu/gameover.tscn")

var pause : bool = false
var sekali :bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Dialogic.start("bokep")
	#get_tree().paused = true
	get_tree().paused = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and false:
		pause = !pause
		Dialogic.start("bokep")
	if $globalui/healthbar.value <= 0 and sekali:
		print("selesai harusnya")
		var loseins = lose.instantiate()
		add_child(loseins)
		get_tree().paused = true
		sekali = false


func _on_spawnspeed_timeout() -> void:
	var spawnerins = spawner.instantiate()
	$player/player/Path2D/PathFollow2D.progress_ratio = randf()
	spawnerins.global_position = $player/player/Path2D/PathFollow2D.global_position
	add_child(spawnerins)
	#print("spawn")


func _on_victory_body_entered(body: Node2D) -> void:
	var victoryins = victory.instantiate()
	add_child(victoryins)
	get_tree().paused = true


func _on_timestart_timeout() -> void:
	$tembok.queue_free()
