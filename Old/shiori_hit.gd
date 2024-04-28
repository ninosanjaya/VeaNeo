extends Area2D

var entered = false

#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var animation_player_2 = $"../../AnimationPlayer2"
@onready var sprite_2d = $".."
@onready var dialogue_box = $"../../../UI/DialogueBox"
@onready var animation_player = $"../../AnimationPlayer"
@onready var world_2 = $"../../.."

@onready var timer_label = $"../../../UI/Timer"
@onready var alltime = $"../../ALLTIME"

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		#print("don't touch me!!!")
		if Input.is_action_just_pressed("attack") && Global.locking == true && Global.talking == false && sprite_2d.visible == true:
			#animation_player_2.play("shiori_hit")
			if world_2.switch == 1:
				animation_player.play("shiori_end")
				timer_label.visible = false
				alltime.stop()
			
			if world_2.switch == 2:
				world_2.fuwatime()
				animation_player.play("shiori_end")
				timer_label.visible = false
				alltime.stop()
				
			#dialogue_box.start("shiori_end")
			


