extends Node2D

var object
var img
@onready var gpu_particles_2d = $GPUParticles2D

@onready var box_shape = RectangleShape2D.new()
@export var tex : Texture2D
var count = 300
#@onready var player2 = get_parent().get_node("Character_switcher/Player2_2")

# Called when the node enters the scene tree for the first time.
func _ready():
	#for i in range(count):
	#	create_objects(Vector2(randf_range(0,180), randf_range(-10,-10)))
	pass
		
func create_objects(pos=Vector2(0,0)):
	box_shape.size = Vector2(8,8)
	var ps = PhysicsServer2D
	object = ps.body_create()
	ps.body_set_space(object, get_world_2d().space)
	ps.body_add_shape(object, box_shape)
	ps.body_set_param(object, PhysicsServer2D.BODY_PARAM_FRICTION, 0.1)
	
	var trans = Transform2D(0, Vector2(550, -10))
	ps.body_set_state(object, PhysicsServer2D.BODY_STATE_TRANSFORM, trans)
	
	var rs = RenderingServer
	img = rs.canvas_item_create()
	rs.canvas_item_set_parent(img, get_canvas_item())
	rs.canvas_item_add_texture_rect(img, Rect2(-8,-8, 16, 16), tex)
	rs.canvas_item_set_transform(img, trans)

var direction = Vector3(1,0,0)
var direction2 = Vector3(-1,0,0)
var gravity = Vector3(200,0,0)
var gravity2 = Vector3(-200,0,0)

func _physics_process(delta):
	#var trans = PhysicsServer2D.body_get_state(object, PhysicsServer2D.BODY_STATE_TRANSFORM)
	#RenderingServer.canvas_item_set_transform(img, trans)
	if Global.right_global == true:
		#gpu_particles_2d.Initial_velocity_min = 70
		#gpu_particles_2d.Initial_velocity_max = 70
		gpu_particles_2d.process_material.set("direction", direction )
		gpu_particles_2d.process_material.set("gravity", gravity )
	if Global.right_global == false:
		#gpu_particles_2d.Initial_velocity_min = -70
		#gpu_particles_2d.Initial_velocity_max = -70
		gpu_particles_2d.process_material.set("direction", direction2 )
		gpu_particles_2d.process_material.set("gravity", gravity2 )
#func _exit_tree():
#	PhysicsServer2D.free_rid(object)
#	RenderingServer.free_rid(img)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
