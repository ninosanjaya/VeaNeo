extends Area2D

#damage script for bullet, attack player
@export var damage : int = 1
#@onready var player = get_parent().get_node("Player")
#@onready var player2 = get_parent().get_node("Player2")
#@onready var defense = get_parent().get_node("Player/CharacterStateMachine/Defense2")
@onready var projectiles_2 = $".."

func _ready():
	pass

func _process(_delta):
	#if GameManager.health_player_one <= 0:
	
	if Global.death == true:
			projectiles_2.queue_free()

func _on_body_entered(body):
		#print("enter")
		#print(Global.death)
	#for child in body.get_children():
		#print(child) ((body.get_name() == "Player" or body.get_name() == "Player2")
		if (body.get_name() == "Player" or body.get_name() == "Player2"):
		#if child is Damageable:
			#var direction_to_damageable = (body.global_position - get_parent().global_position)
			#var direction_sign = sign(direction_to_damageable.x)
			#print_debug(body.name + " took "+ str(damage) + ".")
			#if (direction_sign > 0):
			#	child.hit(damage, Vector2.RIGHT)
			#elif (direction_sign < 0):
		#		child.hit(damage, Vector2.LEFT)
			#else:
			#	child.hit(damage, Vector2.ZERO)
#			GameManager.health_player_one -= 1
			if (body.get_name() == "Player"):
				#print(body.state_machine.current_state.get_name())
				if (body.state_machine.current_state.get_name() == "Defense2"):
						#print("defense")
					GameManager.health_player_one -= 0
					projectiles_2.queue_free()
					#GameManager.save()
					
				else:
					
					GameManager.health_player_one -= damage
					Input.start_joy_vibration(0,0.5,0,1)
					var directionK = global_position.direction_to(body.global_position)
					var explosion_force = directionK * 10.0
					body.knockback = explosion_force
					Global.enemy_knockback = true
					projectiles_2.queue_free()
					#GameManager.save()
					
					#print(knockback)
					#print("hitted")
			if (body.get_name() == "Player2"):
				GameManager.health_player_one -= damage
				Input.start_joy_vibration(0,0.5,0,1)
				var directionK2 = global_position.direction_to(body.global_position)
				var explosion_force = directionK2 * 10.0
				body.knockback = explosion_force
				Global.enemy_knockback = true
				projectiles_2.queue_free()
				#GameManager.save()
		
			
