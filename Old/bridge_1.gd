extends StaticBody2D

@onready var sprite_2d = $Sprite2D

var entered
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		sprite_2d.material.set_shader_parameter("outline_select", true)
		print("bridge")
		
	else:
		print("NO")
		sprite_2d.material.set_shader_parameter("outline_select", false)


func _on_area_2d_body_entered(body):
	if (body is Player) or (body is Player2):
		entered = true


func _on_area_2d_body_exited(body):
	entered = false
