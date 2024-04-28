extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var sensor = 0
@onready var world3 = get_parent().get_parent().get_parent().get_parent().get_node("World3")
@onready var player = get_parent().get_parent().get_parent().get_node("Player")
@onready var player2 = get_parent().get_parent().get_parent().get_node("Player2")
# Called when the node enters the scene tree for the first time.
@onready var sfx = $"../sfx"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if sensor == 1:
		if Input.is_action_just_pressed("up"):
			animated_sprite_2d.play("default")	
			sfx.playing = true
			Global.score += 10
			if world3.switch == 1:
				player.sprite_2d.flip_h = false
				pass
			elif world3.switch == 2:
				world3.fuwatime()
				player.sprite_2d.flip_h = false
		#else:
		#	sfx.playing = false
			
	if sensor == 0 && Global.rhythm_start == true:
		if Input.is_action_just_pressed("up"):
			animated_sprite_2d.play("wrong")	
			Global.score -= 10
			if world3.switch == 1:
				player.sprite_2d.flip_h = false
				player.get_hitted()
			elif world3.switch == 2:
				world3.fuwatime()
				player.get_hitted()

func _on_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 1
	Global.sensor_AU = 1


func _on_area_shape_exited(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 0
	Global.sensor_AU = 0
