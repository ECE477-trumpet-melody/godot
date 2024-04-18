extends Node2D

var time_begin
var time_delay
var score

var check_top
var check_mid
var check_bot

var top
var mid
var bot

func _ready():
	score = 0
	check_top = false
	check_mid = false
	check_bot = false
	
	time_begin = Time.get_ticks_usec()
	time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()
	$Music.play()

func _process(delta):
	$Score.text = str(score)
	
	var time = (Time.get_ticks_usec() - time_begin) / 1000000.0
	time -= time_delay
	time = max(0, time)
	#print("Time is: ", time)
	
	top = Input.is_action_pressed("ui_accept")
	mid = Input.is_action_pressed("ui_down")
	bot = Input.is_action_pressed("ui_up")
	
	if check_top:
		if Input.is_action_just_pressed("ui_accept") && !(mid || bot):
			score += 1
			check_top = false
	if check_mid:
		if Input.is_action_just_pressed("ui_down") && !(top || bot):
			score += 1
			check_mid = false
	if check_bot:
		if Input.is_action_just_pressed("ui_up") && !(top || mid):
			score += 1
			check_bot = false

func _on_top_area_entered(area):
	check_top = true
func _on_top_area_exited(area):
	check_top = false

func _on_mid_area_entered(area):
	check_mid = true
func _on_mid_area_exited(area):
	check_mid = false

func _on_bot_area_entered(area):
	check_bot = true
func _on_bot_area_exited(area):
	check_bot = false
