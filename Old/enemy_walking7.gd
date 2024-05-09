extends "res://Old/enemy_walking4.gd"


func _process(_delta):
	# Add the gravity.
	if state_machine.current_state.name == "Dead":
		Global.enemy7 = true
