extends TextureButton
var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_pressed() -> void:
	if(!isPaused):
		get_tree().paused = true
		isPaused = true
		get_parent().get_node("TempPauseIndicator").set_visible(true)
	else:
		get_tree().paused = false
		isPaused = false
		get_parent().get_node("TempPauseIndicator").set_visible(false)
	pass # Replace with function body.
