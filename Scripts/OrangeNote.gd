extends Area2D
var speed = 8
var velocity = Vector2()

func _ready():
	velocity = Vector2(-speed, 0)
	
func _process(delta):
	translate(velocity)

func _on_area_entered(area):
	pass #check trigger value (.3-0.6)
