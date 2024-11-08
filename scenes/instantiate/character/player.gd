extends CharacterBody2D

@export var darah :float = 100
const SPEED = 10000.0

signal serang
signal interact

var attackable : bool
var hurtable : bool
func _physics_process(delta: float) -> void:
	if attackable and Input.is_action_pressed("serang"):
		serang.emit()
		attackable=false
		$att_cd.start()
	
	
	
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
	print(velocity)
	if Input.is_action_just_pressed("serang"):
		serang.emit()
	if Input.is_action_just_pressed("interact"):
		interact.emit()
	
	var overlap_mobs = $hurtbox.get_overlapping_bodies()
	if overlap_mobs.size() > 0:
		if hurtable:
			darah -= 5 * overlap_mobs.size()
			print("timer stop")
			hurtable=false
			$dmg_cd.start()
	if get_node_or_null("../../settings/mobile/serang") and get_node_or_null("../../settings/mobile/serang").is_pressed:
		$senjata.rotation = $"../../settings/mobile/serang".output.angle()
	if $senjata/slot.global_position > global_position:
		$senjata/slot.flip_v=false
	else:
		$senjata/slot.flip_v=true


func _on_att_timeout() -> void:
	attackable = true


func _on_hurt_timeout() -> void:
	hurtable = true
