extends CanvasLayer

#@onready var attack = $Attack

const UI_ATTACKA = preload("res://art2/UI_attacka.png")
const UI_ATTACKB = preload("res://art2/UI_attackb.png")
# Called when the node enters the scene tree for the first time.
@onready var skill_1 = $skill1
@onready var skill_2 = $skill2
@onready var skill_3 = $skill3
@onready var skill_4 = $skill4


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass


func _on_skill_1_pressed():
	#if GameManager.skill_available[0] != 1:
	#	skill_1.visible = false
	if GameManager.skill_available[0] == 1:
		GameManager.skill_switch_state = 1
		
	else:
		pass
		


func _on_skill_2_pressed():
	if GameManager.skill_available[1] == 1.1:
		GameManager.skill_switch_state = 1.1
	else:
		pass

func _on_skill_3_pressed():
	if GameManager.skill_available[2] == 1.2:
		GameManager.skill_switch_state = 1.2
	else:
		pass


func _on_skill_4_pressed():
	if GameManager.skill_available[3] == 1.3:
		GameManager.skill_switch_state = 1.3
	else:
		pass
