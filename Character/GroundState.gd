extends State


class_name GroundState

@export var JUMP_VELOCITY = -250.0 #-150
@export var air_state : State
@export var jump_animation : String = "jump"

@export var dash_state : State
@export var DASH_VELOCITY = 1000.0 
@export var dash_animation : String = "dash"

var direction : Vector2 = Vector2.ZERO

@export var can_dash : bool = true
@onready var dash_timer = $"../Dash/DashTimer"

@onready var dash_timer_2 = $"../Dash/DashTimer2"
@export var can_dash2 : bool = true

@export var attack_state : State
@export var attack_animation : String = "attack1"
#@onready var atk_timer = $"../Attack/AtkTimer"

@export var skill_state : State
@export var skill_animation : String = "skill"
@export var skill_animation2 : String = "skill2"
@export var skill_animation3 : String = "skill3"
@export var skill_animation4 : String = "skill4"

#@export var ultimate_state : State
#export var ultimate_animation : String = "ultimate"

@onready var damaging = $"../../Damaging"
@export var can_skill : bool = true
@onready var skill_timer = $"../Skill/SkillTimer"

#@export var skillno : int = 0
#var can_switch_attack_set : bool = true
@onready var player = $"../.."

@onready var damaging_2 = $"../../Damaging2"
@onready var damaging_3 = $"../../Damaging3"
@onready var damaging_4 = $"../../Damaging4"
#@onready var damaging_p = $"../../DamagingP"


func state_process(_delta):
	
	if(!character.is_on_floor()):
		next_state = air_state

#var weapons=  [pistol,smg,shotgun,sniper,machinegun,granade,knife,rpg]
#var skill_available=[0,null,null,null] #is blocked or unblocked	
#var counter = 0
#var valid_slots = []

#func get_unlocked():
#		var valid_index = [] #empty nunmbers array to save valid indexes
#		for i in range(available.size()): #size is 8 in this case, range for 0 to 7
#			if available[i] == false: #if gun is locked -->
#				continue # --> skip the actual index, jump to next iteration 
#				valid_index.append(i) #if gun is unlocked, save te index in the array
#		return valid_index #return array and end function 
#according to availables, this function would return [0,3,4,5,7]

func state_input(event : InputEvent):
	if(event.is_action_pressed("up") && Global.talking == false) && Global.dog == false:
		#skill_available[1] = true
		#print(skill_available)
		jump()
	#elif player.Talk_time == true:
	#	pass
		
	
		
		
	if(event.is_action_pressed("dash") && can_dash == true && can_dash2 == true && Global.talking == false) && Global.dog == false:
		dash()
		
	#elif player.Talk_time == true:
	#	pass
		
	#if(event.is_action_pressed("attack")):
	#	attack()
	
	
		
	if(event.is_action_pressed("switchl") ):
		#if GameManager.key_item1 == false
		
		
		
		if GameManager.counter < 3: 
			GameManager.counter += 1 #1
			GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
			#print(counter)
			#GameManager.save()
			if GameManager.skill_switch_state == 0 && GameManager.counter < 3:
				GameManager.counter += 1 #2
				GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
				#print (current_slot)
				#GameManager.save()
				if GameManager.skill_switch_state == 0 && GameManager.counter < 3:
					GameManager.counter += 1 #3
					GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
					#print (current_slot)
					#GameManager.save()
					if GameManager.skill_switch_state == 0:
						GameManager.counter = 0 #3
						GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
						print("zero2")
						print (GameManager.skill_switch_state)
						#GameManager.save()
					else:
						print("three")
						print (GameManager.skill_switch_state)

				else:
					#counter = 0 #3
					#current_slot = skill_available[counter]
					if GameManager.skill_switch_state == 0:
						GameManager.counter = 0 #3
						GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
						print("zero4")
						print (GameManager.skill_switch_state)
						#GameManager.save()
					else:
						print("two")
						print (GameManager.skill_switch_state)
			else:
				#counter = 0 #3
				#current_slot = skill_available[counter]
				if GameManager.skill_switch_state == 0:
					GameManager.counter = 0 #3
					GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
					print("zero3")
					print (GameManager.skill_switch_state)
					#GameManager.save()
				else:
					print("one")
					print (GameManager.skill_switch_state)
		else:
			GameManager.counter = 0
			GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
			print("zero1")
			print (GameManager.skill_switch_state)
			#GameManager.save()
			#print(counter)
		
		#if GameManager.skill_switch_state < 3:
		#	GameManager.skill_switch_state += 1
		#else:
		#	GameManager.skill_switch_state = 0
			
		#print(skillno)
		
	elif(event.is_action_pressed("switchr") ):
		
		#if GameManager.skill_switch_state > 0:
		#	GameManager.skill_switch_state -= 1
		#else:
		#	GameManager.skill_switch_state = 3
		
		#skill_available[1] = 1
		#skill_available[2] = 2
		#skill_available[3] = 3
			
		if GameManager.counter > 0: 
			GameManager.counter -= 1 #1
			GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
			#print(counter)
			#GameManager.save()
			if GameManager.skill_switch_state == 0 && GameManager.counter > 0:
				GameManager.counter -= 1 #2
				GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
				#print (current_slot)
				#GameManager.save()
				if GameManager.skill_switch_state == 0 && GameManager.counter > 0:
					GameManager.counter -= 1 #3
					GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
					#print (current_slot)
					#GameManager.save()
					if GameManager.skill_switch_state == 0:
						GameManager.counter = 3 #3
						GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
						print("zero2")
						print (GameManager.skill_switch_state)
						#GameManager.save()
					else:
						print("three")
						print (GameManager.skill_switch_state)

				else:
					#counter = 0 #3
					#current_slot = skill_available[counter]
					if GameManager.skill_switch_state == 0:
						GameManager.counter = 3 #3
						GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
						print("zero4")
						print (GameManager.skill_switch_state)
						#GameManager.save()
					else:
						print("two")
						print (GameManager.skill_switch_state)
			else:
				#counter = 0 #3
				#current_slot = skill_available[counter]
				if GameManager.skill_switch_state == 0:
					GameManager.counter = 3 #3
					GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
					print("zero3")
					print (GameManager.skill_switch_state)
					#GameManager.save()
				else:
					print("one")
					print (GameManager.skill_switch_state)
		else:
			GameManager.counter = 3
			GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
			#GameManager.save()
			if GameManager.skill_switch_state == 0:
				GameManager.counter = 2 
				GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
				#GameManager.save()
				if GameManager.skill_switch_state == 0:
					GameManager.counter = 1 #3
					GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
					#GameManager.save()
					if GameManager.skill_switch_state == 0:
						GameManager.counter = 0 #3
						GameManager.skill_switch_state = GameManager.skill_available[GameManager.counter]
						print("zero0")
						print (GameManager.skill_switch_state)
						#GameManager.save()
					else:
						print("one0")
						print (GameManager.skill_switch_state)
					
				else:
					print("two0")
					print (GameManager.skill_switch_state)
			else:
					print("three0")
					print (GameManager.skill_switch_state)

			#print(counter)
		#print(skillno)
		
	if(Input.is_action_pressed("switchc") && Global.can_skill == true && GameManager.skill_switch_state == 1 && GameManager.mana_player_one >= 40 && Global.talking == false) && Global.dog == false:
		
		#if Global.attack_set_state == 3 :
		#	Global.attack_set_state = 2

			#print("set to 1")
		#elif Global.attack_set_state == 2:
		#	Global.attack_set_state = 3
			#print("set to 0")
		skill()
		
	elif(event.is_action_pressed("switchc") && Global.can_skill == true && GameManager.skill_switch_state == 1.1 && GameManager.mana_player_one >= 40 && Global.talking == false) && Global.dog == false:

		#if Global.attack_set_state == 3:
		#	Global.attack_set_state = 2
		#elif Global.attack_set_state == 2:
		#	Global.attack_set_state = 3
			
		skill2()
	
	elif(event.is_action_pressed("switchc") && Global.can_skill == true && GameManager.skill_switch_state == 1.2 && GameManager.mana_player_one >= 40 && Global.talking == false) && Global.dog == false:
		
		#if Global.attack_set_state == 3:
		#	Global.attack_set_state = 2
		#elif Global.attack_set_state == 2:
		#	Global.attack_set_state = 3
			
		skill3()
		
	elif(event.is_action_pressed("switchc") && Global.can_skill == true && GameManager.skill_switch_state == 1.3 && GameManager.mana_player_one >= 40 && Global.talking == false) && Global.dog == false:
		
		#if Global.attack_set_state == 3:
		#	Global.attack_set_state = 2
		#elif Global.attack_set_state == 2:
		#	Global.attack_set_state = 3
			
		skill4()
		
	#if(event.is_action_pressed("map") && Global.talking == false):
		
		#if Global.attack_set_state == false:
		#	Global.attack_set_state = true

	#	GameManager.attack_set_state = !GameManager.attack_set_state 
		#GameManager.save()
		#	Global.attack_set_state = false
		#can_skill = false
		#skill_timer.start()
		
			

		
	#if(event.is_action_pressed("ultimate")):
	#	ultimate()
		


func dash():
	#direction = Input.get_vector("left", "right", "up", "down")
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
	dash_timer.start()
	next_state = dash_state
	playback.travel(dash_animation)
	
func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
	playback.travel(jump_animation)
	
func attack():
	damaging.damage = 2
	next_state = attack_state
	playback.travel(attack_animation)
	
@onready var collision_shape_2d2 = $"../../Damaging2/CollisionShape2D"
@onready var collision_shape_2d3 = $"../../Damaging3/CollisionShape2D"
@onready var collision_shape_2d4 = $"../../Damaging4/CollisionShape2D"

#Baubau
func skill():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true

	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	#GameManager.attack_set_state = !GameManager.attack_set_state 

	GameManager.mana_player_one -= 40
	damaging_2.damage = 3
	next_state = skill_state
	playback.travel(skill_animation)
	#GameManager.save()
	
	#Fuwamoco Baubau combo RAWR AOE meelee rectangle/oval longer

#Shiori
func skill2():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	damaging_3.damage = 5
	next_state = skill_state
	playback.travel(skill_animation2)
	#GameManager.save()
	#Shiori paralysis spell make enemies move slower/corrosion range, shorter range/time than Nerrisa
	
#Nerrissa
func skill3():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	#damaging_p.damage = 3
	next_state = skill_state
	playback.travel(skill_animation3)
	#GameManager.save()
	#Bijou scream AOE meellee square/circle bigger
	
#Bijou
func skill4():
	#if Global.attack_set_state == false:
	#		Global.attack_set_state = true
	#GameManager.attack_set_state = !GameManager.attack_set_state 
	#elif Global.attack_set_state == true:
	#		Global.attack_set_state = false
	GameManager.mana_player_one -= 40
	damaging_4.damage = 4
	next_state = skill_state
	playback.travel(skill_animation4)
	#GameManager.save()
	#Nerrisa singing skill range (like mococo sneeze but more powerful)
	
#Fuwawa fluff attack, melee small, power= 2
#Mococo fuzz attack/sneeze, range mid, power = 1

#Fuwamoco Baubau skill, melee mid, power = 3-4
#Shiori scissor skill depressing?, melee short, power = 4-5
#Bijou throw rocks skill, melee biggest, power = 3-4
#Nerrisa sing skill, range long, power = 2-3

#Optional-Korone yubi yubi attack(NOT skill), melee small, power = 4

#func ultimate():
#	damaging.damage = 3
#	next_state = ultimate_state
#	playback.travel(ultimate_animation)
	


func _on_skill_timer_timeout():
	can_skill = true
