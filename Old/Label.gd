extends Label

@export var state_machine : CharacterStateMachine
@onready var character_state_machine = $".."

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if state_machine.current_state != null:
		text = "State: " + state_machine.current_state.name
	#pass
