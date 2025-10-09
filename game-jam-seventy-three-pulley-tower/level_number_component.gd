extends Node2D
var level_number


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_level_number() -> int:
	return level_number

func set_level_number(level :int) ->void:
	level_number = level

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
