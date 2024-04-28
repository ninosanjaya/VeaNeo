extends State

# Called when the node enters the scene tree for the first time.
@export var hit_animation : String = "hit"

@export var damageable : Damageable
@export var dead_state : State
@export var dead_animation : String = "dead"
#@export var dead_state : State
@export var knockback_speed : float = 50.00
@export var return_state : State
@onready var timer : Timer = $Timer
#@onready var dead = $"../Dead"
#@onready var enemy_walking = $"../.."

#@export var dead_state : State
#@export var walk_animation : String = "walk"

#@export var pet_animation : String = "pet_v2"
#@export var walk2_animation : String = "idle"
#@export var walkv2 : State
#@onready var timer_2 = $Timer2
#@onready var animation_player_2 = $"../../AnimationPlayer2"

const HIT_EFFECTS = preload("res://hit_effects.tscn")
@onready var hit = $"../../hit"

signal hit_state

func _ready():
	damageable.connect("on_hit", on_damageable_hit)
	#damageable.connect("on_hit2", on_damageable_hit2)
	
func on_enter():
	#character.velocity = knockback_velocity
	timer.start()

func on_damageable_hit(_node: Node, _damage_amount: int, knockback_direction : Vector2):
	#animation_player_2.play("slash")
	#_spawn_hit_effect2()
	print("hit")
	if(damageable.health > 0):
		
		##character.velocity = knockback_speed * knockback_direction
		#print(character.velocity)
		playback.travel(hit_animation)
		emit_signal("interrupt_state", self)
		hit.playing = true
		#next_state = return_state
		#print("hit")
		#enemy_walking.walk33 = true
	else:
		#damageable.dead1 = true
		#damageable.health = 5
		#print(character.velocity)
		#emit_signal("interrupt_state", dead_state)
		##character.velocity = knockback_speed * knockback_direction
		#print(character.velocity)
		emit_signal("interrupt_state", self)
		playback.travel(dead_animation)
		Global.wardem_dead = true
		next_state = dead_state
		#enemy_walking.walk33 = false
		hit.playing = true
		print("dead1")
		
		
	if GameManager.mana_player_one < 100:
		GameManager.mana_player_one += 10
		#GameManager.save()
	else:
		GameManager.mana_player_one = 100
		#GameManager.save()
		

	


func _on_timer_timeout(): #for knockback
	#playback.travel(walk_animation)
	#if GameManager.enemies_done == false:
		next_state = return_state
	#if GameManager.enemies_done == true:
		#next_state = walkv2



#func _on_timer_2_timeout():
#	playback.travel(walk2_animation)
#	next_state = walkv2
	
func _spawn_hit_effect2() -> void:
	var hit_effect2 : Sprite2D = HIT_EFFECTS.instantiate()
	add_child(hit_effect2)
	#print("Effec")
