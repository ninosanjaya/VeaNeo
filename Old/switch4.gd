extends Area2D



var entered = false
@onready var animated_sprite_2d = $AnimatedSprite2D
var pressed = false
@onready var damageable = $Damageable
#@onready var Door1_pos = get_parent().get_node("World/Area2D")
@onready var sfx_click = $"../sfx_click"

func _on_body_entered(body : Node2D):
	if (body is Player) or (body is Player2):
		entered = true


func _on_body_exited(_body):
	entered = false

func _ready():
	animated_sprite_2d.frame = 0	
	damageable.connect("on_hit", on_damageable_hit)
		
func on_damageable_hit():
	if pressed == false:
		Global.passkeyNumber += str(4)
		animated_sprite_2d.frame = 1	
		pressed = true
		
func _process(_delta):
	if entered == true && pressed == false:
		#print("enter")
		#GameManager.last_position = Vector2(102,16)
			#print(GameManager.variable4)
			#GameManager.health_player_one = 3
			#GameManager.mana_player_one = 100
		animated_sprite_2d.material.set_shader_parameter("outline_select", true)
		if Input.is_action_just_pressed("attack"):
				Global.passkeyNumber += str(4)
				animated_sprite_2d.frame = 1	
				pressed = true
				sfx_click.playing = true
				#print("press")
	else:
		animated_sprite_2d.material.set_shader_parameter("outline_select", false)
				
	if pressed == true:
		animated_sprite_2d.frame = 1		
		#print("keep press")
