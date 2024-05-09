extends State


class_name HitStateE

@export var damageable : Damageable
@export var dead_animation : String = "dead_v1"
@export var dead_state : State
@export var knockback_speed : float = 50.00
@export var return_state : State
@onready var timer : Timer = $Timer
@onready var dead = $"../Dead"
@onready var enemy_walking = $"../.."

@export var hit_animation : String = "hit_v1"
@export var walk_animation : String = "walk_v1"

@export var pet_animation : String = "pet_v2"
@export var walk2_animation : String = "idle_v2"
@export var walkv2 : State
@onready var timer_2 = $Timer2
#@onready var animation_player_2 = $"../../AnimationPlayer2"

const HIT_EFFECTS = preload("res://Old/hit_effects.tscn")

signal hit_state
@onready var hit = $"../../hit"
@onready var puppy = $"../../puppy"

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	damageable.connect("on_hit2", on_damageable_hit2)
	
func on_enter():
	#character.velocity = knockback_velocity
	timer.start()
	
func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction : Vector2):
	#animation_player_2.play("slash")
	#_spawn_hit_effect2()
	if(damageable.health > 0):
		
		character.velocity = knockback_speed * knockback_direction
		#print(character.velocity)
		playback.travel(hit_animation)
		emit_signal("interrupt_state", self)
		hit.playing = true
		#print("hit")
		#enemy_walking.walk33 = true
	else:
		damageable.dead1 = true
		damageable.health = 5
		#print(character.velocity)
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
		hit.playing = true
		#enemy_walking.walk33 = false
		#print("dead")
		
		
	if GameManager.mana_player_one < 100:
		GameManager.mana_player_one += 10
		#GameManager.save()
	else:
		GameManager.mana_player_one = 100
		#GameManager.save()
		
func on_damageable_hit2(_node: Node, _damage_amount: int, _knockback_direction : Vector2):
	
	GameManager.mana_player_one += 10
	
	#GameManager.save()
	
	#emit_signal("hit_state")
	
	#if(damageable.health > 0):
	#	character.velocity = knockback_speed * knockback_direction
		#print(character.velocity)
	#	emit_signal("interrupt_state", self)
	#else:
	#	damageable.health = 5
		#print(character.velocity)
	#	emit_signal("interrupt_state", dead_state)
	#	playback.travel(dead_animation)
	if GameManager.enemies_done == true:
		playback.travel(pet_animation)
		#next_state = walkv2
		puppy.playing = true
		timer_2.start()
	
	if GameManager.mana_player_one < 100:
		GameManager.mana_player_one += 10
		#GameManager.save()
	else:
		GameManager.mana_player_one = 100
		#GameManager.save()
		
#unc on_exit():
	#character.velocity = Vector2.ZERO
	


func _on_timer_timeout(): #for knockback
	#playback.travel(walk_animation)
	#if GameManager.enemies_done == false:
		next_state = return_state
	#if GameManager.enemies_done == true:
		#next_state = walkv2



func _on_timer_2_timeout():
	playback.travel(walk2_animation)
	next_state = walkv2
	
func _spawn_hit_effect2() -> void:
	var hit_effect2 : Sprite2D = HIT_EFFECTS.instantiate()
	add_child(hit_effect2)
	#print("Effec")
