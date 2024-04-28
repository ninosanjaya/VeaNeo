extends Control

@onready var skill_1 = $Skill1
@onready var skill_2 = $Skill2
@onready var skill_3 = $Skill3
@onready var skill_4 = $Skill4

const UI_SKILL_1_ready = preload("res://art2/UI_skill1.0.png")
const UI_SKILL_1_dark = preload("res://art2/UI_skill1.1.png")
const UI_SKILL_2_ready = preload("res://art2/UI_skill2.0.png")
const UI_SKILL_2_dark = preload("res://art2/UI_skill2.1.png")
const UI_SKILL_3_ready = preload("res://art2/UI_skill3.0.png")
const UI_SKILL_3_dark = preload("res://art2/UI_skill3.1.png")
const UI_SKILL_4_ready = preload("res://art2/UI_skill4.1.png")
const UI_SKILL_4_dark = preload("res://art2/UI_skill4.0.png")

@onready var label = $Label
@onready var label_2 = $Label2
@onready var label_3 = $Label3
@onready var label_4 = $Label4
@onready var timer = $Timer

var once = true
# Called when the node enters the scene tree for the first time.
func _ready():
	#skill_1.visible = true
	label.visible = false
	label_2.visible = false
	label_3.visible = false
	label_4.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(GameManager.skill_available)
	#skill_1.visible = true
	if GameManager.skill_available[0] != 1:
		skill_1.visible = false
	elif GameManager.skill_available[0] == 1:
		skill_1.visible = true
		
	if GameManager.skill_available[1] != 1.1:
		skill_2.visible = false
	elif GameManager.skill_available[1] == 1.1:
		skill_2.visible = true
	
	if GameManager.skill_available[2] != 1.2:
		skill_3.visible = false
	elif GameManager.skill_available[2] == 1.2:
		skill_3.visible = true
	
	if GameManager.skill_available[3] != 1.3:
		skill_4.visible = false
	elif GameManager.skill_available[3] == 1.3:
		skill_4.visible = true
	
	if Global.can_skill == true &&  GameManager.mana_player_one >= 40 :
		skill_1.texture = UI_SKILL_1_ready
		skill_2.texture = UI_SKILL_2_ready
		skill_3.texture = UI_SKILL_3_ready
		skill_4.texture = UI_SKILL_4_ready
	else:
		skill_1.texture = UI_SKILL_1_dark
		skill_2.texture = UI_SKILL_2_dark
		skill_3.texture = UI_SKILL_3_dark
		skill_4.texture = UI_SKILL_4_dark
	
	if Global.can_skill == false && once == true:
			timer.start()
			once = false
			#print("start")
	if Global.can_skill == false && GameManager.skill_available[0] == 1:
				label.visible = true
				label.set_text(str(timer.get_time_left()).pad_decimals(2))
	if Global.can_skill == false && GameManager.skill_available[1] == 1.1:
				label_2.visible = true
				label_2.set_text(str(timer.get_time_left()).pad_decimals(2))
	if Global.can_skill == false && GameManager.skill_available[2] == 1.2:
				label_3.visible = true
				label_3.set_text(str(timer.get_time_left()).pad_decimals(2))
	if Global.can_skill == false && GameManager.skill_available[3] == 1.3:
				label_4.visible = true
				label_4.set_text(str(timer.get_time_left()).pad_decimals(2))
	
	if GameManager.skill_switch_state == 1:
		skill_1.material.set_shader_parameter("outline_select", true)
		skill_2.material.set_shader_parameter("outline_select", false)
		skill_3.material.set_shader_parameter("outline_select", false)
		skill_4.material.set_shader_parameter("outline_select", false)
	elif  GameManager.skill_switch_state == 1.1:
		skill_1.material.set_shader_parameter("outline_select", false)
		skill_2.material.set_shader_parameter("outline_select", true)
		skill_3.material.set_shader_parameter("outline_select", false)
		skill_4.material.set_shader_parameter("outline_select", false)
	elif  GameManager.skill_switch_state == 1.2:
		skill_1.material.set_shader_parameter("outline_select", false)
		skill_2.material.set_shader_parameter("outline_select", false)
		skill_3.material.set_shader_parameter("outline_select", true)
		skill_4.material.set_shader_parameter("outline_select", false)
	elif  GameManager.skill_switch_state == 1.3:
		skill_1.material.set_shader_parameter("outline_select", false)
		skill_2.material.set_shader_parameter("outline_select", false)
		skill_3.material.set_shader_parameter("outline_select", false)
		skill_4.material.set_shader_parameter("outline_select", true)
	
	#sprite_2d.material.set_shader_parameter("outline_select", true)	


func _on_timer_timeout():
	label.visible = false
	label_2.visible = false
	label_3.visible = false
	label_4.visible = false
	once = true
	Global.can_skill = true
