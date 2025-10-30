extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_top_left_scroll_button_mouse_entered() -> void:
	
	if get_parent().get_parent().get_node("ScrollingNode").position.y < get_parent().get_parent().get_node("ScrollingNode").get_max_scroll_height():
		get_parent().get_parent().get_node("ScrollingNode").set_scroll_velocity_y(150)
	pass # Replace with function body.
	



func _on_bottom_left_scroll_button_mouse_entered() -> void:
	if get_parent().get_parent().get_node("ScrollingNode").position.y > -100:
		get_parent().get_parent().get_node("ScrollingNode").set_scroll_velocity_y(-150)
	pass # Replace with function body.


func _on_top_left_scroll_button_mouse_exited() -> void:
	get_parent().get_parent().get_node("ScrollingNode").set_scroll_velocity_y(0)
	pass # Replace with function body.


func _on_bottom_left_scroll_button_mouse_exited() -> void:
	get_parent().get_parent().get_node("ScrollingNode").set_scroll_velocity_y(0)
	pass # Replace with function body.
