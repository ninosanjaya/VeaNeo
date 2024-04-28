extends "res://Shooter.gd"

@onready var player = $"../Player"
@onready var player_2 = $"../Player2"
@onready var world_2 = $".."
@export var bulletscene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	right = false
	sprite_2d.flip_h = false
	
	
	
func _process(_delta):
	#sprite_2d.flip_h = true
	animation_player.play("shoot_2")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

