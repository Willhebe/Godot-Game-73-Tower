extends Node2D
@export var level_scene : PackedScene
@export var gold_key_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level = level_scene.instantiate()
	level.get_node("LevelNumberComponent").set_level_number(0)
	add_child(level)
	
	level = level_scene.instantiate()
	level.get_node("LevelNumberComponent").set_level_number(1)
	add_child(level)
	
	level = level_scene.instantiate()
	level.get_node("LevelNumberComponent").set_level_number(2)
	var gold_key = gold_key_scene.instantiate()
	gold_key.position = Vector2(580,245)
	level.add_child(gold_key)
	
	add_child(level)
	
	pass # Replace with function body.

func instantiate_level(level_number : int )-> void:
	var level = level_scene.instantiate()
	level.get_node("LevelNumberComponent").set_level_number(level_number)
	var gold_key = gold_key_scene.instantiate()
	gold_key.position = Vector2(580,525 - 140 * level_number )
	level.add_child(gold_key)
	add_child(level)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func getMaximumFloor() -> int:
	var level_count = -1
	for child in get_children():
		if (child.get_node("LevelNumberComponent").get_level_number() > level_count):
			if (child.isLevelFinishedActivating()):
				level_count = child.get_node("LevelNumberComponent").get_level_number()
	return level_count
