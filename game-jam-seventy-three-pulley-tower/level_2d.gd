extends Node2D
var level_been_activated = false
var gold_key_dismiss_in_progress = false
var delta_count = 0

@export var worker_scene : PackedScene

var left_worker
var right_worker

var left_pipeline
var right_pipeline
var left_messge_tube
var right_message_tube

@export var materials_scene : PackedScene

var left_materials_needed
var right_materials_needed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("FloorSprite").position = Vector2(571,575 - 140*get_node("LevelNumberComponent").get_level_number())
	get_node("FloorSprite").scale = Vector2(1.2,1.2)
	
	if (get_node("LevelNumberComponent").get_level_number()<2):
		level_been_activated = true
	
	if (level_been_activated == false):
		left_worker = worker_scene.instantiate()
		left_worker.position = Vector2 (310.0,525.0- 140*get_node("LevelNumberComponent").get_level_number())
		left_worker.set_floor(get_node("LevelNumberComponent").get_level_number())
		left_worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
		left_worker.set_visible(false)
		
		add_child(left_worker)
	
		right_worker = worker_scene.instantiate()
		right_worker.position = Vector2 (840.0,525.0- 140*get_node("LevelNumberComponent").get_level_number())
		right_worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
		right_worker.set_floor(get_node("LevelNumberComponent").get_level_number())
		right_worker.set_visible(false)
		add_child(right_worker)
		
		left_materials_needed = materials_scene.instantiate()
		left_materials_needed.position = Vector2 (45.0,474.0 - 140 * get_node("LevelNumberComponent").get_level_number())
		left_materials_needed.set_floor(get_node("LevelNumberComponent").get_level_number())
		left_materials_needed.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
		left_materials_needed.set_visible(false)
		get_parent().get_parent().get_node("MaterialsNeededCollection").add_child(left_materials_needed)
		left_materials_needed.set_materials_needed_amount()
		
		right_materials_needed = materials_scene.instantiate()
		right_materials_needed.position = Vector2 (1045.0,474 - 140 * get_node("LevelNumberComponent").get_level_number())
		right_materials_needed.set_floor(get_node("LevelNumberComponent").get_level_number())
		right_materials_needed.set_visible(false)
		right_materials_needed.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
		get_parent().get_parent().get_node("MaterialsNeededCollection").add_child(right_materials_needed)
		right_materials_needed.set_materials_needed_amount()
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!level_been_activated && get_node("LevelNumberComponent").get_level_number() >= 2 && get_node("LevelScoreGoalComponentNode2D").isActive()):
		level_been_activated = true
		gold_key_dismiss_in_progress = true
		
		print(get_child_count())
		get_child(get_child_count() - 3).get_node("AnimatedSprite2D").play("turning")
	if (gold_key_dismiss_in_progress):
		delta_count += delta
		if (delta_count > 3):
			# Once gold key has been turning for 3 seconds remove it
			var gold_key = get_node("GoldKeyNode2D")
			#var gold_key = get_child(get_child_count() - 3)
			remove_child(gold_key)
			gold_key.queue_free()
			delta_count = 0
			gold_key_dismiss_in_progress = false
			left_worker.set_visible(true)
			right_worker.set_visible(true)
			left_materials_needed.set_visible(true)
			right_materials_needed.set_visible(true)
			remove_child(left_worker)
			get_parent().get_parent().get_node("WorkerCollection").add_child(left_worker)
			remove_child(right_worker)
			get_parent().get_parent().get_node("WorkerCollection").add_child(right_worker)
			
			#instantiate new level and add to levelcollection
			
			get_parent().instantiate_level(get_node("LevelNumberComponent").get_level_number()+1) 
			
	pass

func isLevelFinishedActivating()-> bool:
	if (gold_key_dismiss_in_progress):
		return false
	return level_been_activated
