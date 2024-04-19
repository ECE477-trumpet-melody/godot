extends Control

var check_top
var check_mid
var check_bot

var top
var mid
var bot

var trigger
var check_slider
var color

var partCount

func _ready():
	check_top = false
	check_mid = false
	check_bot = false
	check_slider = false
	color = 0
	partCount = 0
	
func _process(delta):
	trigger = Input.get_action_strength("side_slide")
	
	if partCount < 9:
		check_slider = true
	elif partCount < 19:
		$"BG 1".hide()
		$"BG 2".show()
		if ((trigger < 0.33) && (color == 1)) || ((trigger < 0.67) && (trigger >= 0.33) && (color == 2)) || ((trigger >= 0.67) && (color == 3)):
			check_slider = true
		else:
			check_slider = false
	else:
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")
		
	top = Input.is_action_pressed("ui_accept")
	mid = Input.is_action_pressed("ui_up")
	bot = Input.is_action_pressed("ui_down")

	if check_top:
		if Input.is_action_just_pressed("ui_accept") && !(mid || bot):
			if !check_slider:
				Input.start_joy_vibration(0, 0.6, 0, 0.00001)
			else:
				Input.start_joy_vibration(0, 0.3, 0, 0.00001)
			check_top = false
		elif (mid || bot):
			if !check_slider:
				Input.start_joy_vibration(0, 0.9, randf_range(0,1), 0.00001)
			else:
				Input.start_joy_vibration(0, 0.6, 0, 0.00001)
			check_top = false
	if check_mid:
		if Input.is_action_just_pressed("ui_up") && !(top || bot):
			if !check_slider:
				Input.start_joy_vibration(0, 0.5, 0, 0.00001)
			else:
				Input.start_joy_vibration(0, 0.2, 0, 0.00001)
			check_mid = false
		elif (top || bot):
			if !check_slider:
				Input.start_joy_vibration(0, 0.9, randf_range(0,1), 0.00001)
			else:
				Input.start_joy_vibration(0, 0.5, 0, 0.00001)
			check_mid = false
	if check_bot:
		if Input.is_action_just_pressed("ui_down") && !(top || mid):
			if !check_slider:
				Input.start_joy_vibration(0, 0.4, 0, 0.00001)
			else:
				Input.start_joy_vibration(0, 0.1, 0, 0.00001)
			check_bot = false
		elif (top || mid):
			if !check_slider:
				Input.start_joy_vibration(0, 0.9, randf_range(0,1), 0.00001)
			else:
				Input.start_joy_vibration(0, 0.4, 0, 0.00001)
			check_bot = false

func _on_top_area_entered(area):
	check_top = true
	partCount += 1	
func _on_top_area_exited(area):
	check_top = false
	
func _on_mid_area_entered(area):
	check_mid = true
	partCount += 1	
func _on_mid_area_exited(area):
	check_mid = false
	
func _on_bot_area_entered(area):
	check_bot = true
	partCount += 1	
func _on_bot_area_exited(area):
	check_bot = false
