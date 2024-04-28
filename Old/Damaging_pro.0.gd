extends Area2D

#damage script for player projectile
@export var damage : int = 1
#@onready var player = get_parent().get_node("Player")
#@onready var player2 = get_parent().get_node("Player2")
#@onready var defense = get_parent().get_node("Player/CharacterStateMachine/Defense2")
@onready var projectiles_2 = $".."

func _ready():
	pass


func _on_body_entered(body):
	for child in body.get_children():
	
		if child is Damageable:
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			print_debug(body.name + " took "+ str(damage) + ".")
			if (direction_sign > 0):
				child.hit(damage, Vector2.RIGHT)
			elif (direction_sign < 0):
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)
#			GameManager.health_player_one -= 1
			
			#child.hit(damage)
				
			
			

