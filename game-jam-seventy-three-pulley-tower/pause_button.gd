extends TextureButton
var isPaused = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_normal = load ("res://GodotImages/WillPlayPlaceholderGraphic.png")
	scale = Vector2(0.3,0.3)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_pressed() -> void:
	if(!isPaused):
		get_tree().paused = true
		isPaused = true
		get_parent().get_node("ColorRect").set_visible(true)
		get_parent().get_node("ColorRect2").set_visible(true)
		get_parent().get_node("MainMenuTextureButton").set_visible(true)
		texture_normal = load ("res://GodotImages/WillPlayPlaceholderGraphic.png")
		scale = Vector2(0.3,0.3)
		
	else:
		get_tree().paused = false
		isPaused = false
		get_parent().get_node("ColorRect").set_visible(false)
		get_parent().get_node("ColorRect2").set_visible(false)
		get_parent().get_node("MainMenuTextureButton").set_visible(false)
		
		texture_normal = load ("res://GodotImages/pause_sprite_0.png")

		scale = Vector2 (2.5,2.5)
	pass # Replace with function body.
