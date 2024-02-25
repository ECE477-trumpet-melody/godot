extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")

var vol_indx = AudioServer.get_bus_index("Master")

func _on_new_volume(value):
	AudioServer.set_bus_volume_db(vol_indx, linear_to_db(value))
	
