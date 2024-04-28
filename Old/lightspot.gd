extends Sprite2D

@onready var timer = $Timer
@onready var timer_2 = $Timer2

var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = 0
	
var rng3 = RandomNumberGenerator.new()


	##	effects.rotation = rng2.randi_range(0,60) randf_range(-4, 6.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation != -1 && can_move == true:
		var tween = create_tween()
		if tween.is_running():
			tween.stop()
		tween.tween_property(self, "rotation", -1, 1)
		tween.play()
		timer.start()
		can_move = false
		timer.wait_time = rng3.randf_range(0.00,2.00)
	


func _on_timer_timeout():
	var tween2 = create_tween()
	if tween2.is_running():
		tween2.stop()
	tween2.tween_property(self, "rotation", 1, 1)
	tween2.play()
	timer_2.start()
	timer_2.wait_time = rng3.randf_range(0.00,2.00)
	
	
	


func _on_timer_2_timeout():
	can_move = true
