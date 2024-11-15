extends CharacterBody2D

@export var darah :float = 100
@export var expi : int
@onready var bunny = preload("res://scenes/instantiate/character/mob.tscn")
const SPEED = 10000.0

signal serang
signal interact

var kill : int = 0
var score : float
var attackable : bool = true
var hurtable : bool = true

func _physics_process(delta: float) -> void:
	global.score = kill*expi
	if attackable and Input.is_action_pressed("serang"):
		serang.emit()
		attackable=false
		$att.start(1)
	
	if Input.is_action_just_pressed("spawn"):
		var mob = bunny.instantiate()
		mob.position= Vector2(randi_range(1,500),randi_range(1,500))
		get_parent().get_parent().add_child(mob) 
	
	var dir = Input.get_vector("kiri", "kanan", "naik","turun" )
	velocity = dir*SPEED*delta
	move_and_slide()
	#print(global_position)
	var pex= dir.x
	var pey= dir.y
	if pey > -0.5 and pey < 0.5 and pex > 0:
		$anim.play("kanan") 
	elif pey > -0.5 and pey < 0.5 and pex < 0:
		$anim.play("kiri")
	elif  pey > 0:
		$anim.play("turun")
	elif  pey < 0:
		$anim.play("naik")
	if velocity == Vector2(0,0) :
		$anim.stop()
	#print(velocity)

	if Input.is_action_just_pressed("interact"):
		interact.emit()
	
	#print(darah)
	var overlap_mobs = $hurtbox.get_overlapping_bodies()
	if overlap_mobs.size() > 0:
		#print(overlap_mobs.size())
		if hurtable:
			darah -= 5 * overlap_mobs.size()
			print(darah)
			hurtable=false
			$hurt.start()
			$"../../globalui/healthbar".value = darah
	if get_node_or_null("../../settings/anchor/mobile/serang") and get_node_or_null("../../settings/anchor/mobile/serang").is_pressed:
		$senjata.rotation = $"../../settings/anchor/mobile/serang".output.angle()
	if global.settings["mouseaim"]:
		$senjata.rotation = get_local_mouse_position().angle()
	if $senjata/slot.global_position > global_position:
		$senjata/slot.flip_v=false
	else:
		$senjata/slot.flip_v=true


func _on_att_timeout() -> void:
	#print("waaa")
	attackable = true

func _on_hurt_timeout() -> void:
	hurtable = true

func take_exp(amount):
	expi += amount
	print(expi)

func take_kill():
	kill += 1

func _on_interbox_body_entered(body: Node2D) -> void:
	pass
	#print("masuk")
