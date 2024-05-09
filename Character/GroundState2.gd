extends State

#Ground 1 evil
class_name GroundState2

@export var JUMP_VELOCITY = -250.0 #-150
@export var air_state : State
@export var jump_animation : String = "jump"

@export var dash_state : State
@export var DASH_VELOCITY = 1000.0 
@export var dash_animation : String = "dash"

var direction : Vector2 = Vector2.ZERO

@export var can_dash : bool = true
@export var can_dash2 : bool = true
@onready var dash_timer_2 = $"../Dash2/DashTimer2"
@onready var dash_timer_3 = $"../Dash2/DashTimer3"

@onready var skill_timer_2 = $"../Skill2/SkillTimer2"



@export var attack_state : State
@export var attack_animation : String = "attack1"

@export var skill_state : State
@export var skill_animation : String = "skill"
@export var skill_animation2 : String = "skill2"
@export var skill_animation3 : String = "skill3"
@export var skill_animation4 : String = "skill4"

#@export var ultimate_state : State
#export var ultimate_animation : String = "ultimate"

#@onready var damaging = $"../../Damaging2"
#@export var can_skill : bool = true

#@onready var damaging_3 = $"../../Damaging3"
#@onready var damaging_4 = $"../../Damaging4"
#@onready var damaging_5 = $"../../Damaging5"

#@onready var Projectile = preload("res://Projectiles2.tscn")
#@onready var Projectile = preload("res://projectile.tscn")
#@onready var world = get_node("/root/World")
#@onready var world2 = get_node("/root/World2")
#@onready var world3 = get_node("/root/World3")
#onready var world4 = get_node("/root/World4")
#@onready var worldF = get_node("/root/WorldF")
#@onready var enemy = get_node("/root/World/Enemy_walking")
#@onready var enemy2 = get_node("/root/World/Enemy_walking2")
#@onready var player = get_parent().get_node("Player")

#var held_item = null

#signal throw_item()
#@onready var held_item_position = $"../../Sprite2D2/HeldItemPosition"

#@onready var player_2 = $"../.."
#@onready var facing = player_2.right #true is right
#@onready var sprite_2d = $"../../Sprite2D2"
#@onready var facing = sprite_2d.flip_h #true is right
@onready var sprite_2d = $"../../mococo"
@onready var player_2 = $"../.."

func state_process(_delta):
	#print(player.GroundState.skillno)
	if(!character.is_on_floor()):
		next_state = air_state

func state_input(event : InputEvent):
	if(event.is_action_pressed("up")) && Global.talking== false && Global.dog == false:
		jump()
		
		
	if(event.is_action_pressed("dash") && can_dash == true && can_dash2 == true) && Global.talking == false && Global.dog == false:
		dash()
		
	#if(event.is_action_pressed("attack")):
	#	attack()
		
	
	#if(event.is_action_pressed("ultimate")):
	#	ultimate()
	#if (event.is_action_pressed("map")  && Global.talking == false):
	#	GameManager.attack_set_state = !GameManager.attack_set_state 
		#GameManager.save()
		#if Global.attack_set_state == false:
		#	Global.attack_set_state = true

		#elif Global.attack_set_state == true:
		#	Global.attack_set_state = false
		#can_skill = false
		#skill_timer_2.start()
		


func dash():
	direction = Input.get_vector("left", "right", "up", "down")
	if (character.right == true && character.left == false):
		character.normal_speed = false
		character.velocity.x =  DASH_VELOCITY
	elif (character.right == false && character.left == true):
		character.normal_speed = false
		character.velocity.x =  -DASH_VELOCITY

		
	if (direction.x >0):
		character.velocity.x =  DASH_VELOCITY
	elif (direction.x <0):
		character.velocity.x =  -DASH_VELOCITY
	can_dash = false
	can_dash2 = false
	dash_timer_2.start()
	dash_timer_3.start()
	next_state = dash_state
	playback.travel(dash_animation)
	
func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
	playback.travel(jump_animation)
	
#func attack():
	#emit_signal("throw_item")
	#var projectile = Projectile.instantiate()
	#world.add_child(projectile)
	#projectile.position = character.position
	#if enemy:
#		var direction = (enemy.position - character.position).normalized()
#		projectile.launch(direction)
	#velocity = Vector2.ZERO
	#spawn_rock()
	#damaging.damage = 2
	#next_state = attack_state
	#playback.travel(attack_animation)
	

func skill():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true

	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	GameManager.mana_player_one -= 40
	#damaging_3.damage = 3
	next_state = skill_state
	playback.travel(skill_animation)
	#GameManager.save()

func skill2():
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true

	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	#damaging_4.damage = 5
	next_state = skill_state
	playback.travel(skill_animation2)
	#GameManager.save()
	
func skill3():
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true

	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	#damaging.damage = 3
	next_state = skill_state
	playback.travel(skill_animation3)
	#GameManager.save()
	
func skill4():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	#damaging_5.damage = 4
	next_state = skill_state
	playback.travel(skill_animation4)
	#GameManager.save()
	
#func ultimate():
#	damaging.damage = 3
#	next_state = ultimate_state
#	playback.travel(ultimate_animation)

#func spawn_rock():
#	if held_item == null:
#		held_item = Projectile.instantiate()
#		held_item_position.add_child(held_item)
		
#func _on_throw_item():
#	if held_item == null:
#		held_item = Projectile.instantiate()
#		held_item_position.add_child(held_item)
#	held_item.launch(sprite_2d.flip_h)
		#print(sprite_2d.flip_h)
#	held_item = null



