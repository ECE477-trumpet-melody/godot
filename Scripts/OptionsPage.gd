extends Control

@onready var volume = %Volume
var vol_indx = AudioServer.get_bus_index("volControl")

var sets: Settings

func _ready():
	$volumeTest.play()
	sets = Settings.loadIn()
	if volume:
		volume.value = sets.music_volume
	
func _on_button_pressed():
	$volumeTest.stop()
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_new_volume(value):
	AudioServer.set_bus_volume_db(vol_indx, linear_to_db(value))
	if sets:
		sets.music_volume = value
		sets.save()
	
#func _on_volume_drag_ended(value_changed):
#	if value_changed == true:
#		$volumeTest.play()
