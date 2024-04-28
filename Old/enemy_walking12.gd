extends "res://enemy_walking11.gd"

func _process(_delta):
	# Add the gravity.
	#print(state_machine.current_state.name)
	if state_machine.current_state.name == "Dead":
		Global.enemy12 = true
