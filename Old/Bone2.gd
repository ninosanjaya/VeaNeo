extends Area2D

@onready var bone = $"../Bone"
@onready var world_4 = $".."
@onready var player = $"../Player"
@onready var player_2 = $"../Player2"

@export var dogwalk : String = "dogwalk"
@export var dogidle : String = "dogidle"

@export var entered = false
var next39_2 = false
var direction : Vector2 = Vector2.ZERO
#var next39 = false
#@onready var Door1_pos = get_parent().get_node("World/Area2D")

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _ready():
	if GameManager.passkeyB == true:
		visible = true
	elif GameManager.passkeyB == false:
		visible = false
	
func _process(_delta):
	if entered == true && bone.next39 == true && next39_2 == false:
		#direction = Input.get_vector("left", "right", "up", "down")
		Global.openB =  true
		next39_2 = true
		Global.dog = false
		visible = true
		if world_4.switch == 1:
			player.normal()
		if world_4.switch == 2:
			player_2.normal()
		
	
		
