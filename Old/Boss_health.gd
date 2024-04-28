extends Control

@onready var enemy_final_boss = $"../../Enemy_final_boss"
@onready var progress_bar = $ProgressBar

@onready var damageable = get_parent().get_parent().get_node("Enemy_final_boss/Damageable")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_bar.value = damageable.health
