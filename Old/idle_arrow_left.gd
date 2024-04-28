extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var sensor = 0
@onready var world3 = get_parent().get_parent().get_parent().get_parent().get_node("World3")
@onready var player = get_parent().get_parent().get_parent().get_node("Player")
@onready var player2 = get_parent().get_parent().get_parent().get_node("Player2")
@onready var sfx = $"../sfx"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(world3.switch)
	if sensor == 1:
		if Input.is_action_just_pressed("left"):
			animated_sprite_2d.play("default")
			sfx.playing = true
			Global.score += 10
			if world3.switch == 1:
				pass
			elif world3.switch == 2:
				world3.fuwatime()
		#else:
		#	sfx.playing = false
	
	if sensor == 0 && Global.rhythm_start == true:
		if Input.is_action_just_pressed("left"):
			animated_sprite_2d.play("wrong")	
			Global.score -= 10
			if world3.switch == 1:
				player.get_hitted()
			elif world3.switch == 2:
				world3.fuwatime()
				player.get_hitted()


func _on_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 1
	Global.sensor_AL = 1


func _on_area_shape_exited(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 0
	Global.sensor_AL = 0
