extends "res://Old/enemy_walking8_0.gd"


func _process(_delta):
	# Add the gravity.
	#print(state_machine.current_state.name)
	if state_machine.current_state.name == "Dead":
		Global.enemy8 = true
