extends State


#class_name AirState2

@export var ground_state : State
@export var jump_animation : String = "jump"

@export var dash_state : State
@export var dash_animation : String = "dash"
@onready var dash_timer = $"../Dash2/DashTimer2"
@onready var dash_timer_3 = $"../Dash2/DashTimer3"

#@onready var damaging_4 = $"../../Damaging4"
@export var skill_state : State
@export var skill_animation4 : String = "skill4_2"

var has_double_jumped = false

func state_process(_delta):
	if(character.is_on_floor()):
		next_state = ground_state
		
func state_input(event : InputEvent):
	if (event.is_action_pressed("up") && !has_double_jumped):
		double_jump()		
		
	if(event.is_action_pressed("dash") && ground_state.can_dash == true):
		dash()
	
	#ground pound. can't implement, need to redo all
	#if(event.is_action_pressed("skill") && Global.can_skill == true && GameManager.skill_switch_state == 1.3 && GameManager.mana_player_one > 40 && Global.talking == false) && Global.dog == false:
	#	GameManager.mana_player_one -= 40
	#	damaging_4.damage = 3
	#	character.velocity.y = -ground_state.JUMP_VELOCITY # /2
	#	next_state = skill_state
	#	playback.travel(skill_animation4)
		
func on_exit():
	if (next_state == ground_state):
		has_double_jumped = false

func double_jump():
	character.velocity.y = ground_state.JUMP_VELOCITY # /2
	playback.travel(jump_animation)
	has_double_jumped = true
	
func dash():
	#direction = Input.get_vector("left", "right", "up", "down")
	if (character.right == true && character.left == false):
		character.normal_speed = false
		character.velocity.x =  ground_state.DASH_VELOCITY
	elif (character.right == false && character.left == true):
		character.normal_speed = false
		character.velocity.x =  -ground_state.DASH_VELOCITY

	ground_state.can_dash = false
	ground_state.can_dash2 = false
	dash_timer.start()
	dash_timer_3.start()
	next_state = dash_state
	playback.travel(dash_animation)
	

