extends TileMap

@onready var character_switcher = $"../Character_switcher"
#@onready var digger = get_parent().get_node("Character_switcher/Player1_2")
# Called when the node enters the scene tree for the first time.
func _ready():
	#print(get_parent().get_node("Player"))
	pass

var dig_mode  = false
var dig_mode_down  = false
var dig_mode_up = false
var dig_mode_right = false
var dig_mode_left = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_parent().has_node("Character_switcher/Player1_2"):
		
		#print("digger here")
		
		var digger = get_parent().get_node("Character_switcher/Player1_2")
		var playcell = local_to_map(digger.position - Vector2(0,5))
		var cell = local_to_map(digger.position - Vector2(0,-10))
		var celldown = local_to_map(digger.position - Vector2(0,-10))
		var celldown2 = local_to_map(digger.position - Vector2(10,-10))
		var celldown3 = local_to_map(digger.position - Vector2(-10,-10))
		var cellup = local_to_map(digger.position - Vector2(0, 30))
		var cellright = local_to_map(digger.position - Vector2(-10,5))
		var cellright2 = local_to_map(digger.position - Vector2(-10,20))
		var cellleft = local_to_map(digger.position - Vector2(10,5))
		var cellleft2 = local_to_map(digger.position - Vector2(10,20))
		#print(cell)
		if (Input.is_action_just_pressed("down")) && dig_mode == false:
			#if get_cell_source_id(0, cell):
			#print(get_cell_source_id(0, cell))
			if get_cell_source_id(1, cell) == 1: #check layer 1 & id 1 
				if get_cell_source_id(0, cell) == 1:
					digger.velocity.y += 10
					set_cell(0, cell, -1, Vector2i(2,6))
					set_cell(0, celldown2, -1, Vector2i(2,6))
					set_cell(0, celldown3, -1, Vector2i(2,6))
					dig_mode_down = true
					dig_mode = true
					print("digging")
		
			
		#print(get_cell_source_id(1, playcell))
		
		if dig_mode == true:
			#if (Input.is_action_just_pressed("down")):
				
				#if dig_mode_down == true:
					#digger.velocity.y += 10
				if get_cell_source_id(0, celldown) == 1:
					set_cell(0, celldown, -1, Vector2i(2,6))
			#if (Input.is_action_just_pressed("up")):
				
				if dig_mode_up == true:
					if get_cell_source_id(1, cellup) == 1: 
						digger.velocity.y -= 10
						if get_cell_source_id(0, cellup) == 1:
							set_cell(0, cellup, -1, Vector2i(2,6))
					elif get_cell_source_id(1, cellup) == -1:
						digger.velocity.y -= 1
					#elif get_cell_source_id(0, cellup) == 2:
						#digger.velocity.y = 0
						#dig_mode_up = false
						#print("stop")
			#if (Input.is_action_just_pressed("right")):
				
				if dig_mode_right == true:
					digger.velocity.x += 50
					digger.velocity.y -= 10
					if get_cell_source_id(0, cellright) == 1:
						set_cell(0, cellright, -1, Vector2i(2,6))
						set_cell(0, cellright2, -1, Vector2i(2,6))
					#elif get_cell_source_id(0, cellright) == 2:
						#digger.velocity.x = 0
						#dig_mode_right = false
						#print("stop")
			#if (Input.is_action_just_pressed("left")):
				
				if dig_mode_left == true: 
					digger.velocity.x -= 50
					digger.velocity.y -= 10
					if get_cell_source_id(0, cellleft) == 1:
						set_cell(0, cellleft, -1, Vector2i(2,6))
						set_cell(0, cellleft2, -1, Vector2i(2,6))
					#elif get_cell_source_id(0, cellleft) == 2:
						#digger.velocity.x = 0
						#dig_mode_left = false
						#print("stop")
						
				#if get_cell_source_id(0, cellleft) != 1:
				#	digger.velocity.x = 0
				#	digger.velocity.y = 0
		if (Input.is_action_just_pressed("down")) && get_cell_source_id(1, cell) == 1:
			dig_mode = true
			dig_mode_down = true
			dig_mode_up = false
			dig_mode_right = false
			dig_mode_left = false
		elif (Input.is_action_just_pressed("up")) && get_cell_source_id(1, cell) == 1:
			dig_mode = true
			dig_mode_down = false
			dig_mode_up = true
			dig_mode_right = false
			dig_mode_left = false
			print("dig_mode_up")
		elif  (Input.is_action_just_pressed("right")) && get_cell_source_id(1, cell) == 1:
			dig_mode = true
			dig_mode_down = false
			dig_mode_up = false
			dig_mode_right = true
			dig_mode_left = false
			print("dig_mode_right")
		elif  (Input.is_action_just_pressed("left")) && get_cell_source_id(1, cell) == 1:
			dig_mode = true
			dig_mode_down = false
			dig_mode_up = false
			dig_mode_right = false
			dig_mode_left = true
			print("dig_mode_left")
		if dig_mode == true && get_cell_source_id(1, playcell) == -1:
			dig_mode = false
			dig_mode_down = false
			dig_mode_up = false
			dig_mode_right = false
			dig_mode_left = false
			print("not digging")
		elif dig_mode == false && get_cell_source_id(1, playcell) == 1:
			dig_mode = true
			
		
		
		#set_cell(0, Vector2i(1,9), 0, Vector2i(2,6))
	else:
		pass
		#set_cell(0, Vector2i(1,9), -1, Vector2i(2,6))
		#print("erasing")
	#if (Input.is_action_just_pressed("down")):
	#	var tile : Vector2i = local_to_map(get_global_mouse_position())
	#	set_cells_terrain_connect(0, tile, 0, -1)
	
