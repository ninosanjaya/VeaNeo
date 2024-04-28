extends Popup

#TBD later
#Video/Display: Fullscreen, Window, FPS, etc
#Audio: BGM, Sound/SFX, Mute, etc
#Control/Gameplay: XBOX&Keyboard, Input mapping?, etc

@onready var option_button = $TabContainer/Options/GridContainer/OptionButton
@onready var check_button = $TabContainer/Options/GridContainer/CheckButton
@onready var h_slider = $TabContainer/Options/GridContainer/HSlider
@onready var h_slider_2 = $TabContainer/Options/GridContainer/HSlider2
@onready var h_slider_3 = $TabContainer/Options/GridContainer/HSlider3
@onready var sfx = $sfx

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx.playing = false
	option_button.add_item("Window")
	option_button.add_item("Fullscreen")
	GameOption.load_data()
	#print("setts")
	option_button.select(1 if GameOption.fullscreen_on else 0)
	Global.toggle_fullscreen(GameOption.fullscreen_on)
	check_button.button_pressed = GameOption.vsync_on
	
	h_slider.value = GameOption.master_vol
	h_slider_2.value = GameOption.bgm_vol
	h_slider_3.value = GameOption.sfx_vol
	option_button.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print(GameManager.master_vol)
	pass

func _on_option_button_item_selected(index): #fullscreen
	#sfx.playing = true
	Global.toggle_fullscreen(true if index == 1 else false)
	GameOption.save()


func _on_check_button_toggled(toggled_on): #vsync
	#sfx.playing = true
	Global.toggle_vsync(toggled_on)
	GameOption.save()


func _on_h_slider_value_changed(value): #master audio
	#sfx.playing = true
	Global.update_master_vol(value)
	GameOption.save()


func _on_h_slider_2_value_changed(value): #bgm
	#sfx.playing = true
	Global.update_bgm_vol(value)
	GameOption.save()


func _on_h_slider_3_value_changed(value): #sfx
	#sfx.playing = true
	Global.update_sfx_vol(value)
	GameOption.save()
