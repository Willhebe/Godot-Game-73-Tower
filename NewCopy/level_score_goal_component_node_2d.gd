extends Node2D
var level_score_goal
var is_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_number = get_parent().get_node("LevelNumberComponent").get_level_number()
	match level_number:
		0,1:
			is_active = true
			level_score_goal = 0
		2:
			level_score_goal = 10
	pass # Replace with function body.

func get_level_score_goal() -> int:
	return level_score_goal

func isActive() -> bool:
	return is_active

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!is_active):
		if level_score_goal <= LevelInfo.get_level_score():
			is_active = true
	pass
