extends Area2D

#@onready var collision_shape_2d = $Bridge2/CollisionShape2D
@onready var collision_shape_2d = $"../CollisionShape2D"

@onready var player =  get_parent().get_parent().get_node("Player")
@onready var player_2 =  get_parent().get_parent().get_node("Player2")


@onready var air = get_parent().get_parent().get_node("Player/CharacterStateMachine/Air")
@onready var air2 = get_parent().get_parent().get_node("Player2/CharacterStateMachine2/Air2")

@onready var bridge = $"../Bridge"
@onready var entered1 = bridge.entered1
@export var entered2 = false
# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (entered2 == true) and ((entered1 == true) or (entered1 == false)):
			collision_shape_2d.disabled = true
			#print("false")
	#elif (entered2 == false) and ((entered1 == true) or (entered1 == false)):
	#	collision_shape_2d.disabled = false
		#print("true")
		


func _on_body_entered(body):
	if ((body.get_name() == "Player" or body.get_name() == "Player2")):
		if (player.state_machine.current_state == air):
			entered2 = true
		if (player_2.state_machine.current_state == air2):
			entered2 = true

	#else:
		#collision_shape_2d.disabled = false
		


func _on_body_exited(_body):
	#if (body is Player) or (body is Player2):
	entered2 = false
	#collision_shape_2d.disabled = false
