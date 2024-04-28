extends StaticBody2D

var entered = false
var count = 0
@onready var timer = $Timer
var cancount = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(Global.count_pebble)
	if entered == true && cancount == true:
		Global.count_pebble += 1
		timer.start()
		cancount = false
		


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true

func _on_area_2d_body_exited(_body):
	entered = false
	

#@onready var Door1_pos = get_parent().get_node("World/Area2D")



func _on_timer_timeout():
	cancount = true
