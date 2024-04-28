extends State

class_name Skill

@export var return_state : State
@export var return_animation_node : String = "move"
@export var skill_name : String = "skill"
@export var skill_name2 : String = "skill2"
@export var skill_name3 : String = "skill3"
@export var skill_name4 : String = "skill4"

#@onready var skill_timer = $SkillTimer
@onready var skill_timer = $SkillTimer
@export var ground_state : State


#func state_process(_delta):
#	if(character.is_on_floor()):
#		next_state = ground_state

func _on_animation_tree_animation_finished(anim_name):	
	if (anim_name == skill_name):
		can_move = true
		skill_timer.start()
		Global.can_skill = false
		next_state = return_state
		playback.travel(return_animation_node)
	elif (anim_name == skill_name2):
		can_move = true
		skill_timer.start()
		Global.can_skill = false
		next_state = return_state
		playback.travel(return_animation_node)
	elif (anim_name == skill_name3):
		can_move = true
		skill_timer.start()
		Global.can_skill = false
		next_state = return_state
		playback.travel(return_animation_node)
	elif (anim_name == skill_name4):
		can_move = true
		skill_timer.start()
		Global.can_skill = false
		next_state = return_state
		playback.travel(return_animation_node)
		

#func _on_skill_timer_timeout():
#		next_state = return_state
#		playback.travel(return_animation_node)


func _on_skill_timer_timeout(): #Cooldown skill
	#can_move = true
	pass
	#print("canskill")


func _on_animation_tree_animation_started(_anim_name):
	can_move = false
