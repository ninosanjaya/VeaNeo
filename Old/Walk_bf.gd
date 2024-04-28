extends State

# Called when the node enters the scene tree for the first time.
@export var walk_animation : String = "walk"
@export var throw_animation : String = "throw"
@export var laser_animation : String = "laser"

@onready var timer_attack = $Timer_attack

var can_time1 = true
@export var can_attack = true

@export var throw_state : State
@export var laser_state : State
@export var attacking = 0
var random_attack = 0

@export var dead_state : State
@export var dead_animation : String = "dead"
var once = false

@export var hit_animation : String = "hit"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.wardem_dead  == false && Global.recoil == false:
		print("walk")
		playback.travel(walk_animation)
	#elif Global.wardem_dead  == false && Global.recoil == true:
	#	print("hit")
	#	playback.travel(hit_animation)
	elif  Global.wardem_dead  == true && Global.recoil == false && once == false:
		print("dead2")
		#playback.travel(dead_animation)
		next_state = dead_state
		once = true
	#playback.travel(dead_animation)
	#print(can_time1)
	#print(random_attack)
	#print(can_attack)
	
	if random_attack == 0 && can_attack == true && Global.wardem_dead  == false && Global.recoil == false:
		print("walk2")
		attacking = 0
		playback.travel(walk_animation)
	elif random_attack == 1 && can_attack == true && Global.wardem_dead  == false && Global.recoil == false:
		playback.travel(throw_animation)
		attacking = 1
		next_state = throw_state
		#can_attack = false
		
	elif random_attack == 2 && can_attack == true && Global.wardem_dead  == false && Global.recoil == false:
		playback.travel(laser_animation)
		attacking = 2
		next_state = laser_state
		#can_attack = false
		
	if can_time1 == true && Global.wardem_dead  == false && Global.recoil == false:
		timer_attack.start()
		can_time1 = false
		

		
	
	
		

var rng = RandomNumberGenerator.new()

func _on_timer_attack_timeout():
	can_time1 = true
	random_attack = rng.randi_range (0,2)
	can_attack = true
	
	
	
