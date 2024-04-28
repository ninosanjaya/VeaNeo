extends Area2D


var entered = false
#@onready var P1 = get_node("Player")
#@onready var P2 = get_node("Player2")
#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var world_2 = $"../.."
#@onready var first = $first
#@onready var P1 = $"../../Player"
#@onready var P2 = $"../../Player2"
@onready var animation_player_2 = $"../AnimationPlayer2"
@onready var dialogue_box = $"../../UI/DialogueBox"
@onready var sprite_2d = $"../Sprite2D"

#var shiori_meeting = false

#var next20 = false

@onready var player = $"../../Player"
@onready var player2 = $"../../Player2"


@onready var camera_2d = $"../../Camera2D"
@onready var camera_2d_2 = $"../../Camera2D2"
@onready var camera_2d_3 = $"../../Camera2D3"
@onready var camera_2d_4 = $"../../Camera2D4"

var room2 = false
@onready var blocker = $"../StaticBody2D/CollisionShape2D"

#@export var oneandtwo = false
#@export var twoandthree = false
#@export var threeandfour = false
@export var fourandone = false

	
func _process(_delta):
	#P1.animation_player.play("move")
	if entered == true:
		fourandone = true
		#Global.talking = true
		#player.camera_2d.set_current(false)
		#player2.camera_2d.set_current(false)
			#animation_player.play("cutscene_boss1p2")
		#P1.animation_player.play("jump")
		#if world_2.switch == 1:
		#	P1.velocity.x = 200
		#	P1.direction.x = 1
		#	P1.animation_tree.set("parameters/move/blend_position", 1)
		#	first.start()
		#	print("runs")
			#room2 = true
	elif  entered == false:
		fourandone = false
		
	#else:
	#	fourandone = false
	#elif entered == false:
	#	room2 = false
	#	camera_2d.enabled = false
	#	camera_2d_2.enabled = false
	#	camera_2d_3.enabled = false
	#	camera_2d_4.enabled = false


		
		
func _on_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true



func _on_body_exited(_body):
	entered = false
