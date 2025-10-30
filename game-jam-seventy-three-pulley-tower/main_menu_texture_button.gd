extends TextureButton
var main_menu_is_visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if (main_menu_is_visible):
		texture_normal = load("res://GodotImages/WillPlaceholderHomeGraphic.png")
	else:
		texture_normal = load("res://GodotImages/WillPlayPlaceholderGraphic.png")
	main_menu_is_visible = !main_menu_is_visible
	pass # Replace with function body.
