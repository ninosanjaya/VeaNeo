extends Area2D

#damage script for enemy projectile, maybe this is not used?
@export var damage : int = 1
#@onready var player = get_parent().get_node("Player")
#@onready var player2 = get_parent().get_node("Player2")
#@onready var defense = get_parent().get_node("Player/CharacterStateMachine/Defense2")
#@onready var projectiles_2 = $".."
@onready var projectile_bounce_enemy = $".."
@onready var Enemy_final_boss = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Enemy_final_boss")
@onready var damageable = get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Enemy_final_boss/Damageable")
#@export var dead_state : State

func _ready():
	pass


func _on_body_entered(body):
	#for child in body.get_children():
		#print(child) ((body.get_name() == "Player" or body.get_name() == "Player2")
		if (body.get_name() == "Player" or body.get_name() == "Player2") && Global.recoil == false:
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
					projectile_bounce_enemy.queue_free()
					#GameManager.save()
					
				else:
					
					GameManager.health_player_one -= damage
					Input.start_joy_vibration(0,0.5,0,1)
					var directionK = global_position.direction_to(body.global_position)
					var explosion_force = directionK * 10.0
					body.knockback = explosion_force
					Global.enemy_knockback = true
					projectile_bounce_enemy.queue_free()
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
				projectile_bounce_enemy.queue_free()
				#GameManager.save()
			#child.hit(damage)
		
		if  (body.get_name() == "Enemy_final_boss") && Global.recoil == true:
			projectile_bounce_enemy.queue_free()
			damageable.hit(10, Vector2.RIGHT) #10 is damage
			#damageable.health -= 10
			Global.recoil = false
			
			
			#Global.wardem_dead = true
			#Enemy_final_boss.state_machine.current_state = dead_state
			#next_state = dead_state
		#elif body.get_name() == "TileMap" or body.get_name() == "Enemy_walking6" or body.get_name() == "Bridge4":
		#	projectiles_2.queue_free()	
				
			
			

