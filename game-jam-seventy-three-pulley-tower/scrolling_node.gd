extends Node2D
var scroll_velocity_y = -50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_parent().get_children():
		# uncomment following to make screen scroll up and down - TODO make this happen when have more levels
		# if a child has the method dont_scroll don't do anything to it. 
		if !child.has_method("dont_scroll"):
			child.position += Vector2(0,scroll_velocity_y * delta)
		pass
	if (position.y < -100):
		scroll_velocity_y *=-1
	elif (position.y > 400):
		scroll_velocity_y *=-1
	
	pass
