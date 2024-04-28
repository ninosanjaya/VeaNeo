extends Area2D

@onready var player = $"../Player"
@onready var player_2 = $"../Player2"
@onready var animation_player = $"../Spikes2/AnimationPlayer"

var entered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation_player.play("traps")
	if entered == true:
		#if GameManager.last_position:
			#player.global_position = GameManager.last_position
			#player_2.global_position = GameManager.last_position
			#player.queue_free()
			#player_2.queue_free()
			GameManager.health_player_one -= 3
			#GameManager.save()

func _on_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false


