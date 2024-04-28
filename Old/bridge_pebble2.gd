extends StaticBody2D


var entered = false
var count = 0
# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer
var cancount = true

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(count)
	if entered == true && cancount == true:
		Global.count_pebble += 1
		timer.start()
		cancount = false
		


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true

func _on_area_2d_body_exited(_body):
	entered = false
	


func _on_timer_timeout():
	cancount = true
