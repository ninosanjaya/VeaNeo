extends Sprite2D

var rngh = RandomNumberGenerator.new()
@onready var timer = $Timer
var can_move1 = false
@onready var timer_2 = $Timer2
@onready var audio_stream_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(330,-24)
	audio_stream_player.playing = false
	timer_2.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move1 == true:
		move1()
		can_move1 = false 

func move1():
		position = Vector2(330,-24)
		var tween = create_tween()
		if tween.is_running():
				tween.stop()
		tween.tween_property(self, "position", Vector2(294,13), 1)
		tween.play()
		timer.start()
		audio_stream_player.playing = true

func _on_timer_timeout():
	position = Vector2(294,13)
	var tween = create_tween()
	if tween.is_running():
				tween.stop()
	tween.tween_property(self, "position",  Vector2(330,-24), 1)
	tween.play()
	#timer.wait_time = rngh.randf_range(10.00,100.00)
	timer_2.start()
	
	
	#can_move1 = true


func _on_timer_2_timeout():
	can_move1 = true
