extends Node


var leftT_or_rightF


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_leftT_or_rightF() -> bool:
	return leftT_or_rightF

func set_leftT_or_rightF(isLeft :bool) ->void:
	leftT_or_rightF = isLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
