extends Area2D
var speed = 8
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(-speed, 0)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity)
