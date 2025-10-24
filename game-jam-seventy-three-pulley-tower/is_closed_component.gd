extends Node2D
var isClosed = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().get_node("LevelNumberComponent").get_level_number() == 0 :
		isClosed = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func is_closed()-> bool:
	return isClosed
	
func set_is_closed(closed: bool)-> void:
	isClosed = closed
