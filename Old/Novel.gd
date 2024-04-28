extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var player_position
var target_position
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite_2d = $Sprite2D


#@onready var player = get_parent().get_parent().get_node("Player")
#@onready var player2 = get_parent().get_parent().get_node("Player2")
#@onready var player = get_node("/root/World2/Player")
#@onready var player2 = get_node("/root/World2/Player2")

#@onready var player = get_parent().get_node("Player")
#@onready var player2 = get_parent().get_node("Player2")

@onready var world_2 = get_parent().get_parent().get_parent().get_node("World2")
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer

var switching = false

func _process(_delta):
	
	#print("ready")
	animation_player.play("walk")
	#for child in parent.get_children():
		
	if world_2.switch == 1 && switching == false:
		timer.start()
		switching = true
		player_position = get_node("/root/World2/Player").position
		target_position = (player_position - position).normalized()
		#print("1")
		#if target_position.x < 0:
		#		sprite_2d.scale = Vector2(-1,-1)
				#print("false")
		#elif target_position.x > 0:
		#		sprite_2d.scale = Vector2(-1,1)
				#print("true")
		#if position.distance_to(player_position) > 3:
			
		#	velocity = target_position * SPEED
		#	move_and_slide()
		#	look_at(player_position)
			#print(target_position.x)
			
			#print("target")
			#print(target_position)
			#print("player")
			#print(player_position)
			
		#	print("pos1")
	if world_2.switch == 2 && switching == false:
		timer.start()
		switching = true
		player_position = get_node("/root/World2/Player2").position
		target_position = (player_position - position).normalized()
		#print("2")
	if target_position.x < 0:
				sprite_2d.scale = Vector2(-1,-1)
				#print("false")
	elif target_position.x > 0:
				sprite_2d.scale = Vector2(-1,1)
				#print("true")
	if position.distance_to(player_position) > 3:
			
			velocity = target_position * SPEED
			move_and_slide()
			look_at(player_position)
		#	print("pos2")
			


func _on_timer_timeout():
	switching = false
