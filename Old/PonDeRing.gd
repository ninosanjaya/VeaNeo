extends Node2D

var entered = false
@onready var animation_player = $AnimationPlayer
signal terminate_initiated
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#@export var Door1_pos : Vector2 
@onready var audio_stream_player = $AudioStreamPlayer
@onready var timer = $Timer
var once = true
	
func _process(_delta):
	animation_player.play("idle")
	
	if entered == true && once == true:
		GameManager.health_player_one += 1
		if GameManager.health_player_one > 3:
			GameManager.health_player_one = 3
		GameManager.mana_player_one += 40
		if GameManager.mana_player_one > 100:
			GameManager.mana_player_one = 100
		#GameManager.save()
		audio_stream_player.playing = true
		timer.start()
		once = false
		
		

func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_body_exited(_body):
	entered = false


func _on_timer_timeout():
	print("timeoutt")
	once = true
	emit_signal("terminate_initiated")
	queue_free()
