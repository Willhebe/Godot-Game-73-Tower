extends Node2D
var level_score_goal
var is_active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_number = get_parent().get_node("LevelNumberComponent").get_level_number()
	match level_number:
		0:
			is_active = true
			level_score_goal = 0
		1:
			is_active = true
			level_score_goal = 0
		2:
			level_score_goal = 10
			if (Testing.TestingShortLevelGoals):
				level_score_goal = 2
		3:
			level_score_goal = 25
			if (Testing.TestingShortLevelGoals):
				level_score_goal = 4
		4:
			level_score_goal = 50
			if (Testing.TestingShortLevelGoals):
				level_score_goal = 6
		_:
			level_score_goal = 100 * level_number - 400
			if (Testing.TestingShortLevelGoals):
				level_score_goal = 2 * level_number
		
		
		
			
	pass # Replace with function body.

func get_level_score_goal() -> int:
	return level_score_goal

func isActive() -> bool:
	return is_active

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(!is_active):
		if level_score_goal <= LevelInfo.get_level_score():
			is_active = true
	pass
