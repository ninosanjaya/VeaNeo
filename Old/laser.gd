extends RayCast2D

@onready var line_2d = $Line2D

@onready var player = get_parent().get_node("Player")
@onready var player2 = get_parent().get_node("Player2")
@onready var defense = get_parent().get_node("Player/CharacterStateMachine/Defense2")
@onready var world = get_parent().get_parent().get_node("WorldF")

@onready var timer = $Timer #delay
var cast_point
#@onready var collision_shape_2d = $Line2D/Area2D/CollisionShape2D
@export var damage : float = 1
@export var damage2 : float = 2
@onready var gpu_particles_2d = $GPUParticles2D
@onready var gpu_particles_2d_2 = $GPUParticles2D2
@onready var gpu_particles_2d_3 = $GPUParticles2D3

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_physics_process(false)
	line_2d.points[1] = Vector2.ZERO
	#collision_shape_2d.shape.b = Vector2.ZERO
	#self.is_casting = true
	#print("ready")

#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
#	if (event.is_action_pressed("attack")):
		#print(self.is_casting)
#		self.is_casting = true#event.pressed #truw
		#print(self.is_casting)
#	else:
#		self.is_casting = false
		#print(self.is_casting)
		

#var is_casting := false setget set_is_casting
var target = Vector2(0,0)

var is_casting = false:
	set = set_is_casting
var once = false
var once2 = false
@onready var once_time = $onceTime

func _process(delta):
	#if Global.laser == true:
	#pass
	if Global.laser == true  && once == false:
		#print("fire")
		self.is_casting = true
		once_time.start()
		once = true
	elif Global.laser == false:
		#print("nothing")
		self.is_casting = false
		#disappear()
		#once2 = true
	#else:
	#	self.is_casting = false
	#	print("nothing")
		
	#elif Global.laser == false:
	#	self.is_casting = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print("processing")
	#print(self.is_casting)
	#bullet.direction = (player.position - global_position).normalized()
	if world.switch == 1:
		target = (world.P1.position -  global_position) * 5
		timer.start()
		appear()
		
	elif world.switch == 2:
		target = ( world.P2.position - global_position) * 5
		timer.start()
		appear()
		
	#var cast_point =  target  
	#print(collide_with_bodies)
	#if collide_with_bodies:
	#	print("colliding")
	#else:
	
	gpu_particles_2d_2.emitting = is_colliding()
	
	if is_colliding():
		#print((get_collider().get_index()))

		var body_player = str((get_collider().get_index()))
		if (body_player == "13"):
			gpu_particles_2d_2.global_rotation = get_collision_normal().angle()
			gpu_particles_2d_2.position = cast_point
			if (world.switch == 1):
			#_spawn_hit_effect()
				
				 
				if (player.state_machine.current_state == defense):
						#print("defense")
					GameManager.health_player_one -= 0
					#GameManager.save()
					
				else:
					
					GameManager.health_player_one -= damage
					Input.start_joy_vibration(0,0.5,0,1)
					#var directionK = global_position.direction_to(body.global_position)
					#var explosion_force = directionK * 10.0
					#body.knockback = explosion_force
					Global.enemy_knockback = true
					#print(knockback)
					#print("hitted")
					#GameManager.save()
			if (world.switch == 2):
				#_spawn_hit_effect()
				GameManager.health_player_one -= damage
				Input.start_joy_vibration(0,0.5,0,1)
				#var directionK2 = global_position.direction_to(body.global_position)
				#var explosion_force = directionK2 * 10.0
				#body.knockback = explosion_force
				Global.enemy_knockback = true
				#GameManager.save()

		#print("colliding!")
	#	cast_point = to_local(get_collision_point())
	
	#print(cast_point)
	#force_raycast_update()
	#line_2d.points[1] = cast_point

@onready var audio_stream_player = $AudioStreamPlayer

	
func set_is_casting(cast: bool) -> void:
	is_casting = cast
	
	gpu_particles_2d.emitting = is_casting
	gpu_particles_2d_3.emitting = is_casting
	
	if is_casting:
		appear()
		audio_stream_player.playing = true
		#print("appear")
	else:
		gpu_particles_2d_2.emitting = false
		disappear()
		#print("disappear")
		
	set_physics_process (is_casting)
	
#var tween = get_tree().create_tween()

func appear() -> void:
	var tween = create_tween()
	if tween.is_running():
		tween.stop()
	tween.tween_property(line_2d, "width", 30.0, 0.2)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,2), 0.2)
	#tween.interpolate_property(line_2d,"width", 0, 10.0, 0.2)
	tween.play()
	
func disappear():
	var tween = create_tween()
	if tween.is_running():
		tween.stop()
	#tween.stop.all()
	tween.tween_property(line_2d, "width", 0, 0.2)
	#tween.tween_property(collision_shape_2d, "scale", Vector2(0,0), 0.2)
	#tween.interpolate_property(line_2d,"width", 10.0, 0, 0.1)
	tween.play()
	#force_raycast_update()
	#line_2d.points[1] = Vector2(0,0)
	#target_position = Vector2(0,0)


func _on_timer_timeout():
	cast_point =  target  
	force_raycast_update()
	line_2d.points[1] = cast_point
	target_position = cast_point
	#disappear()
	#collision_shape_2d.shape.b = cast_point



func _on_once_time_timeout():
	#once = true
	#once_time_2.start()
	once = false
	#Global.laser = false
	
	#once2 = false
	#pass


