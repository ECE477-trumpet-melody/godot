extends CanvasLayer
@onready var tut_butt = %Tutorial

# Called when the node enters the scene tree for the first time.
func _ready():
	tut_butt.grab_focus()

func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/TutorialPage.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/OptionsPage.tscn")
