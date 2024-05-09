extends Node

@onready var player = $Player
@onready var player_1 = $Player1 #evil
@onready var player_2 = $Player2 #evil
@onready var player_3 = $Player3 #evil
@onready var player_1_2 = $Player1_2 #good
@onready var player_2_2 = $Player2_2 #good
@onready var player_3_2 = $Player3_2 #good

# Called when the node enters the scene tree for the first time.
func _ready():
		
		#Pos1 = P1.global_position
		#self.add_child(P2)
		
		self.remove_child(player_1)
		self.remove_child(player_2)
		self.remove_child(player_3)
		self.remove_child(player_1_2)
		self.remove_child(player_2_2)
		self.remove_child(player_3_2)
		
		
		
		
		GameManager.skill_available=[1,2,3,4] 
		GameManager.skill_switch_state = 1
		
		GameManager.bio_good1 = true
		GameManager.chem_good2 = true
		GameManager.phy_good3 = false
		
		#P2.global_position = Pos1
		#switch_timer.start()
		#switch_time = false

		#switch = 2
		#pass
		print("ready")
var can_switch1 = true
@onready var timer = $Timer
var Pos1
@onready var switch_timer = $Switch_Timer
var active_switch = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#print(GameManager.skill_switch_state)
	if (Input.is_action_pressed("switchl")) && can_switch1 == true:
		#if GameManager.key_item1 == false
		can_switch1 = false
		timer.start()
		
		
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
		
	elif (Input.is_action_pressed("switchr")) && can_switch1 == true:
		
		#if GameManager.skill_switch_state > 0:
		#	GameManager.skill_switch_state -= 1
		#else:
		#	GameManager.skill_switch_state = 3
		
		#skill_available[1] = 1
		#skill_available[2] = 2
		#skill_available[3] = 3
		can_switch1 = false
		timer.start()
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
	#print(player.global_position)
	if(Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 1  && active_switch == true && Global.talking == false) :
		
		#Pos1 = P1.global_position
		#self.add_child(P2)
		
		#self.remove_child(player_1)
		#self.remove_child(player_2)
		#self.remove_child(player_3)
		
		
		#P2.global_position = Pos1
		#switch_timer.start()
		#switch_time = false

		#switch = 2
#		skill()
		##if !player_1:
		#	print("no player1")
		#else:
		#	print("there's player1")
			#player_1 = get_node_or_null(player_1)
		active_switch = false
		switch_timer.start()
		if (has_node ("Player")):
			print("there1")
		elif (has_node ("Player1")):
			Pos1 = player_1.global_position
			self.remove_child(player_1)
			self.add_child(player)
			player.global_position = Pos1
			
		elif (has_node ("Player2")):
			Pos1 = player_2.global_position
			self.remove_child(player_2)
			self.add_child(player)
			player.global_position = Pos1
		elif (has_node ("Player3")):
			Pos1 = player_3.global_position
			self.remove_child(player_3)
			self.add_child(player)
			player.global_position = Pos1
		
		elif (has_node ("Player1_2")):
			Pos1 = player_1_2.global_position
			self.remove_child(player_1_2)
			self.add_child(player)
			player.global_position = Pos1
		elif (has_node ("Player2_2")):
			Pos1 = player_2_2.global_position
			self.remove_child(player_2_2)
			self.add_child(player)
			player.global_position = Pos1
		elif (has_node ("Player3_2")):
			Pos1 = player_3_2.global_position
			self.remove_child(player_3_2)
			self.add_child(player)
			player.global_position = Pos1
		#var playerg = get_tree().get_nodes_in_group("Player")
		#print(playerg.get_name())
		#if playerg.get_name() == "Player":
		#	print("player is here")
	if (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 2 && active_switch == true && Global.talking == false && GameManager.bio_good1 == false) :
		
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_1)
			player_1.global_position = Pos1
		elif (has_node ("Player1")):
			print("there2")
		elif (has_node ("Player2")):
			Pos1 = player_2.global_position
			self.remove_child(player_2)
			self.add_child(player_1)
			player_1.global_position = Pos1
		elif (has_node ("Player3")):
			Pos1 = player_3.global_position
			self.remove_child(player_3)
			self.add_child(player_1)
			player_1.global_position = Pos1
		
		elif (has_node ("Player1_2")):
			print("error")
		elif (has_node ("Player2_2")):
			Pos1 = player_2_2.global_position
			self.remove_child(player_2_2)
			self.add_child(player_1)
			player_1.global_position = Pos1
		elif (has_node ("Player3_2")):
			Pos1 = player_3_2.global_position
			self.remove_child(player_3_2)
			self.add_child(player_1)
			player_1.global_position = Pos1
			
	elif (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 2 && active_switch == true && Global.talking == false && GameManager.bio_good1 == true) :
		
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_1_2)
			player_1_2.global_position = Pos1
		elif (has_node ("Player1")):
			#Pos1 = player.global_position
			#self.remove_child(player)
			#self.add_child(player_1_2)
			#player_1_2.global_position = Pos1
			print("error")
		elif (has_node ("Player2")):
			Pos1 = player_2.global_position
			self.remove_child(player_2)
			self.add_child(player_1_2)
			player_1_2.global_position = Pos1
		elif (has_node ("Player3")):
			Pos1 = player_3.global_position
			self.remove_child(player_3)
			self.add_child(player_1_2)
			player_1_2.global_position = Pos1
			
		elif (has_node ("Player1_2")):
			print("there2.2")
		elif (has_node ("Player2_2")):
			Pos1 = player_2_2.global_position
			self.remove_child(player_2_2)
			self.add_child(player_1_2)
			player_1_2.global_position = Pos1
		elif (has_node ("Player3_2")):
			Pos1 = player_3_2.global_position
			self.remove_child(player_3_2)
			self.add_child(player_1_2)
			player_1_2.global_position = Pos1
			
	if (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 3 && active_switch == true && Global.talking == false && GameManager.chem_good2 == false) :
		
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_2)
			player_2.global_position = Pos1
		elif (has_node ("Player1")):
			Pos1 = player_1.global_position
			self.remove_child(player_1)
			self.add_child(player_2)
			player_2.global_position = Pos1
		elif (has_node ("Player2")):
			print("there3")
		elif (has_node ("Player3")):
			Pos1 = player_3.global_position
			self.remove_child(player_3)
			self.add_child(player_2)
			player_2.global_position = Pos1
			
		elif (has_node ("Player1_2")):
			Pos1 = player_1_2.global_position
			self.remove_child(player_1_2)
			self.add_child(player_2)
			player_2.global_position = Pos1
		elif (has_node ("Player2_2")):
			print("error")
		elif (has_node ("Player3_2")):
			Pos1 = player_3_2.global_position
			self.remove_child(player_3_2)
			self.add_child(player_2)
			player_2.global_position = Pos1
	
	elif (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 3 && active_switch == true && Global.talking == false && GameManager.chem_good2 == true) :
		
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_2_2)
			player_2_2.global_position = Pos1
		elif (has_node ("Player1")):
			Pos1 = player_1.global_position
			self.remove_child(player_1)
			self.add_child(player_2_2)
			player_2_2.global_position = Pos1
		elif (has_node ("Player2")):
			print("error")
		elif (has_node ("Player3")):
			Pos1 = player_3.global_position
			self.remove_child(player_3)
			self.add_child(player_2_2)
			player_2_2.global_position = Pos1
			
		elif (has_node ("Player1_2")):
			Pos1 = player_1_2.global_position
			self.remove_child(player_1_2)
			self.add_child(player_2_2)
			player_2_2.global_position = Pos1
		elif (has_node ("Player2_2")):
			print("there3.2")
		elif (has_node ("Player3_2")):
			Pos1 = player_3_2.global_position
			self.remove_child(player_3_2)
			self.add_child(player_2_2)
			player_2_2.global_position = Pos1
			
	if (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 4  && active_switch == true && Global.talking == false && GameManager.phy_good3 == false) :
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_3)
			player_3.global_position = Pos1
		elif (has_node ("Player1")):
			Pos1 = player_1.global_position
			self.remove_child(player_1)
			self.add_child(player_3)
			player_3.global_position = Pos1
		elif (has_node ("Player2")):
			Pos1 = player_2.global_position
			self.remove_child(player_2)
			self.add_child(player_3)
			player_3.global_position = Pos1
		elif (has_node ("Player3")):
			print("there4")
			
		elif (has_node ("Player1_2")):
			Pos1 = player_1_2.global_position
			self.remove_child(player_1_2)
			self.add_child(player_3)
			player_3.global_position = Pos1
		elif (has_node ("Player2_2")):
			Pos1 = player_2_2.global_position
			self.remove_child(player_2_2)
			self.add_child(player_3)
			player_3.global_position = Pos1
		elif (has_node ("Player3_2")):
			print("error")
	
	elif (Input.is_action_pressed("switchc") && GameManager.skill_switch_state == 4  && active_switch == true && Global.talking == false && GameManager.phy_good3 == true) :
		active_switch = false
		switch_timer.start()
		
		if (has_node ("Player")):
			Pos1 = player.global_position
			self.remove_child(player)
			self.add_child(player_3_2)
			player_3_2.global_position = Pos1
		elif (has_node ("Player1")):
			Pos1 = player_1.global_position
			self.remove_child(player_1)
			self.add_child(player_3_2)
			player_3_2.global_position = Pos1
		elif (has_node ("Player2")):
			Pos1 = player_2.global_position
			self.remove_child(player_2)
			self.add_child(player_3_2)
			player_3_2.global_position = Pos1
		elif (has_node ("Player3")):
			print("error")
			
		elif (has_node ("Player1_2")):
			Pos1 = player_1_2.global_position
			self.remove_child(player_1_2)
			self.add_child(player_3_2)
			player_3_2.global_position = Pos1
		elif (has_node ("Player2_2")):
			Pos1 = player_2_2.global_position
			self.remove_child(player_2_2)
			self.add_child(player_3_2)
			player_3_2.global_position = Pos1
		elif (has_node ("Player3_2")):
			print("there4")
			
func _on_timer_timeout():
	can_switch1 = true


func _on_switch_timer_timeout():
	active_switch = true
