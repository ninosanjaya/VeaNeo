extends StaticBody2D

@onready var collision_shape_2d = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global.there_pebble == true:
		collision_shape_2d.disabled = false
	if Global.there_pebble == false:
		collision_shape_2d.disabled = true
