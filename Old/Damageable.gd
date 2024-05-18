extends Node

class_name Damageable

signal on_hit(node : Node, damage_taken : int, knockback_direction : Vector2,  debuff_speed : float)
signal on_hit2(node : Node, damage_taken : int, knockback_direction : Vector2,  debuff_speed : float)

@export var health : float = 5
@export var dead1 : bool = false

func hit (damage : int, knockback_direction : Vector2, debuff_speed : float):
	if dead1 == false:
		health -= damage
		emit_signal("on_hit", get_parent(),damage, knockback_direction, debuff_speed  )
	elif dead1 == true:
		health -= damage
		emit_signal("on_hit2", get_parent(),damage, knockback_direction,  debuff_speed )
	
	
	
	#if (health <= 0):
		
	#	get_parent().queue_free()
		
	
		
