extends Node2D

@export var bulletScene : PackedScene
@onready var player = $"../Player"
@onready var player_2 = $"../Player2"
@onready var world_2 = $".."
@onready var timer = $Timer
var can_shootH = true
@onready var marker_2d = $Sprite2D/Marker2D
signal throw_item()
@onready var animation_player = $AnimationPlayer

@onready var ray_cast_2d = $RayCast2D
@onready var line_2d = $Line2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	animation_player.play("shoot")
	if world_2.switch == 1:
			look_at(player.position)
			if ray_cast_2d.is_colliding():
				line_2d.points[0] = ray_cast_2d.get_collision_point()
			#if can_shootH == true:

	elif world_2.switch == 2:
			look_at(player_2.position)
			if ray_cast_2d.is_colliding():
				line_2d.points[0] = ray_cast_2d.get_collision_point()
			#if can_shootH == true:

	#print(bullet.direction)
	#bullet.direction = 

#func _unhandled_input(event):
#	if (event.is_action_pressed("attack")):
#		var bullet = bulletScene.instance()
#		get_parent().add_child(bullet)
		
func _on_throw_item():
		#print("throwing")
		var bullet = bulletScene.instantiate()
		marker_2d.add_child(bullet)
		bullet.global_position = self.global_position
		#print("shoot")
		if world_2.switch == 1:
			look_at(player.position)
			#if can_shootH == true:
			bullet.direction = (player.position - global_position).normalized()
			#timer.start()
			#	can_shootH = false
			bullet = null
		elif world_2.switch == 2:
			look_at(player_2.position)
			#if can_shootH == true:
			bullet.direction = (player_2.position - global_position).normalized()
			#timer.start()
			#	can_shootH = false
			bullet = null

func _on_timer_timeout():
	can_shootH = true
