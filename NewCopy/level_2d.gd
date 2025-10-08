extends Node2D
var level_been_activated = false
var gold_key_dismiss_in_progress = false
var delta_count = 0
@export var worker_scene : PackedScene
var left_worker
var right_worker

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (get_node("LevelNumberComponent").get_level_number()<2):
		level_been_activated = true
	
	if (level_been_activated == false):
		left_worker = worker_scene.instantiate()
		left_worker.position = Vector2 (310.0,245.0)
		left_worker.set_floor(2)
		left_worker.set_visible(false)
		
		add_child(left_worker)
	
		right_worker = worker_scene.instantiate()
		right_worker.position = Vector2 (840.0,245.0)
		right_worker.set_on_left(false)
		right_worker.set_floor(2)
		right_worker.set_visible(false)
		add_child(right_worker)
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!level_been_activated && get_node("LevelNumberComponent").get_level_number() >= 2 && get_node("LevelScoreGoalComponentNode2D").isActive()):
		level_been_activated = true
		gold_key_dismiss_in_progress = true
		left_worker.set_visible(true)
		right_worker.set_visible(true)
		get_child(get_child_count() - 3).get_node("AnimatedSprite2D").play("turning")
	if (gold_key_dismiss_in_progress):
		delta_count += delta
		if (delta_count > 3):
			# Once gold key has been turning for 3 seconds remove it
			var gold_key = get_child(get_child_count() - 3)
			remove_child(gold_key)
			gold_key.queue_free()
			delta_count = 0
			gold_key_dismiss_in_progress = false
			remove_child(left_worker)
			get_parent().get_parent().get_node("WorkerCollection").add_child(left_worker)
			remove_child(right_worker)
			get_parent().get_parent().get_node("WorkerCollection").add_child(right_worker)
	pass

func isLevelFinishedActivating()-> bool:
	if (gold_key_dismiss_in_progress):
		return false
	return level_been_activated
