extends Node2D

const NOVEL = preload("res://Old/novel.tscn")
@onready var indicator_4 = $Indicator4
@onready var player = $"../Player"
@onready var player_2 = $"../Player2"
@onready var spawn = $spawn

#func _process():
	
# Called when the node enters the scene tree for the first time.
#func _ready():
func spawn1():
	if Global.talking == false && Global.loop_counter_shiori != 6: 
		var rand = RandomNumberGenerator.new()
		var screen_size = get_viewport().get_visible_rect().size
		#print(screen_size) #320,180
		#(2867,32) bottom left (3538,-131) top right
		spawn.playing = true
		for i in range(0,4):
			var enemy = NOVEL.instantiate()
			rand.randomize()
			var x = rand.randf_range(3300,3320)
			rand.randomize()
			var y = rand.randf_range(-100,-47)
			enemy.position.y = y
			enemy.position.x = x
			add_child(enemy)

func spawn2():
	if Global.talking == false  && Global.loop_counter_shiori != 6: 
		var rand = RandomNumberGenerator.new()
		var screen_size = get_viewport().get_visible_rect().size
		#print(screen_size) #320,180
		#(2867,32) bottom left (3538,-131) top right
		spawn.playing = true
		for i in range(0,4):
			var enemy = NOVEL.instantiate()
			rand.randomize()
			var x = rand.randf_range(3478,3811)
			rand.randomize()
			var y = rand.randf_range(-1,52) 
			enemy.position.y = y
			enemy.position.x = x
			add_child(enemy)

func spawn3():
	if Global.talking == false  && Global.loop_counter_shiori != 6: 
		var rand = RandomNumberGenerator.new()
		var screen_size = get_viewport().get_visible_rect().size
		#print(screen_size) #320,180
		#(2867,32) bottom left (3538,-131) top right
		spawn.playing = true
		for i in range(0,4):
			var enemy = NOVEL.instantiate()
			rand.randomize()
			var x = rand.randf_range(3940,3960)
			rand.randomize()
			var y = rand.randf_range(-65,-47)
			enemy.position.y = y
			enemy.position.x = x
			add_child(enemy)

func spawn4():
	if Global.talking == false  && Global.loop_counter_shiori != 6: 
		var rand = RandomNumberGenerator.new()
		var screen_size = get_viewport().get_visible_rect().size
		#print(screen_size) #320,180
		#(2867,32) bottom left (3538,-131) top right
		spawn.playing = true
		for i in range(0,4):
			var enemy = NOVEL.instantiate()
			rand.randomize()
			var x = rand.randf_range(3489,3771)
			rand.randomize()
			var y = rand.randf_range(-200,-180)
			enemy.position.y = y
			enemy.position.x = x
			add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
	#print(Global.loop_counter_shiori)
	#print(indicator_4.fourandone)
	#print(GameManager.key_item1 )
