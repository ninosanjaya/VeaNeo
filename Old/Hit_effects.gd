extends Sprite2D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	 # Replace with function body.
	animation_player.play("slash")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
