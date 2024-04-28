extends Area2D

var speed = 100
var sensor = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta
	
	if position.y > 200:
		queue_free()
		
	if sensor == 1 && position.y > 140:
		
		if Global.sensor_AD == 1:
			if Input.is_action_just_pressed("down"):
				queue_free()


func _on_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 1


func _on_area_shape_exited(_area_rid, _area, _area_shape_index, _local_shape_index):
	sensor = 0
