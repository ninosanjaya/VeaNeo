extends Area2D

#@onready var collision_shape_2d = $Bridge2/CollisionShape2D
@onready var collision_shape_2d = $"../CollisionShape2D"

@onready var player =  get_parent().get_parent().get_node("Player")
@onready var player_2 =  get_parent().get_parent().get_node("Player2")
@export var entered1 = false

@onready var bridge_2 = $"../Bridge2"
@onready var entered2 = bridge_2.entered2

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (entered1 == true) and ((entered2 == true) or (entered2 == false)):
		if (Input.is_action_pressed("down")):
			collision_shape_2d.disabled = true
			#print("false")
	elif (entered1 == false) and ((entered2 == false)):
		collision_shape_2d.disabled = false
		#print("true")
		


func _on_body_entered(body):
	if ((body.get_name() == "Player" or body.get_name() == "Player2")):
		entered1 = true

	#else:
		#collision_shape_2d.disabled = false
		


func _on_body_exited(_body):
	#if (body is Player) or (body is Player2):
	entered1 = false
	#collision_shape_2d.disabled = false
