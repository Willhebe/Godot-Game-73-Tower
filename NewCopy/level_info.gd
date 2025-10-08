extends Node
var level_score = 0
var message_tube_level_offset = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func add_level_score(score :int) ->void:
	level_score += score

func set_level_score(score :int) -> void:
	level_score = score

func get_level_score() -> int:
	return level_score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	  
