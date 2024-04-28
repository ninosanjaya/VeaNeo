extends StaticBody2D

var once = false
#@onready var switch_1 = $"../switch1"
#@onready var switch_2 = $"../switch2"
#@onready var switch_3 = $"../switch3"
#@onready var switch_4 = $"../switch4"
@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var bone_2 = $"../Bone2"

@onready var audio_stream_player = $AudioStreamPlayer
@onready var audio_stream_player_2 = $AudioStreamPlayer2


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.active = true
	if GameManager.passkeyB == true:
			sprite_2d.position = Vector2(2040,-225)
			collision_shape_2d.position = Vector2(2040,-171)
	elif GameManager.passkeyB == false:
		sprite_2d.position = Vector2(2040,-144)
		collision_shape_2d.position = Vector2(2040,-91)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(len(Global.passkeyNumber))
	#if len(Global.passkeyNumber) == 4:
	#	if Global.passkeyNumber == "1234" && GameManager.passkeyN == false:
	#		print("corret")
	#		GameManager.passkeyN = true
	#		animation_player.play("open")
	#	elif Global.passkeyNumber != "1234" && GameManager.passkeyN == false:
	#		print("wrong")
	#		Global.passkeyNumber = ""
	#		switch_1.pressed = false
	#		switch_1.animated_sprite_2d.frame = 0
	#		switch_2.pressed = false
	#		switch_2.animated_sprite_2d.frame = 0
	#		switch_3.pressed = false
	#		switch_3.animated_sprite_2d.frame = 0
	#		switch_4.pressed = false
	#		switch_4.animated_sprite_2d.frame = 0
	if Global.openB == true && GameManager.passkeyB == false:
			#GameManager.passkeyN = true
			GameManager.passkeyB = true
			animation_player.play("open")
			audio_stream_player.playing = true
			audio_stream_player_2.playing = true
			
			#sprite_2d.position = Vector2(2040,-225)
			#collision_shape_2d.position = Vector2(2040,-171)
	#		switch_1.pressed = true
	#		switch_1.animated_sprite_2d.frame = 1
	#		switch_2.pressed = true
	#		switch_2.animated_sprite_2d.frame = 1
	#		switch_3.pressed = true
	#		switch_3.animated_sprite_2d.frame = 1
	#		switch_4.pressed = true
	#		switch_4.animated_sprite_2d.frame = 1
			#GameManager.save()
