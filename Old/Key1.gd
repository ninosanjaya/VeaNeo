extends Sprite2D


@onready var timer = $Timer
@onready var dialogue_box = $"../DialogueBox"
@onready var fanfare = $"../fanfare"
@onready var wow = $"../wow"
@onready var timer_2 = $Timer2

# Called when the node enters the scene tree for the first time.
func _ready():
	wow.visible = false
	wow.modulate.a = 0
	#GameManager.key_item1 = true 
	#GameManager.show1 = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.key_item1 == true && GameManager.show1 == false:
		visible = true
		timer.start()
		GameManager.show1 = true
		fanfare.playing = true
		wow.visible = true
		#GameManager.save()
		var tween = create_tween()
		if tween.is_running():
			tween.stop()
		tween.tween_property(wow, "modulate:a", 1, 0.4)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
		tween.play()
		timer_2.start()
		
		#unique first time get 1 key
	if GameManager.key_item2 == false && GameManager.key_item3 == false && GameManager.key_item1 == true && GameManager.show1_1 == false:
		dialogue_box.start("first key")
		GameManager.show1_1 = true
		#GameManager.save()
		
	


func _on_timer_timeout():
	visible = false
	wow.visible = false


func _on_touch_screen_button_pressed():
	pass # Replace with function body.


func _on_touch_screen_button_released():
	pass # Replace with function body.


func _on_timer_2_timeout():
	var tween = create_tween()
	if tween.is_running():
			tween.stop()
	tween.tween_property(wow, "modulate:a", 0, 0.4)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
	tween.play()
