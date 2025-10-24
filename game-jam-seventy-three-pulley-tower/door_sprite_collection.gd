extends Node2D
@export var door_sprite_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_door(0)
	add_door(1)
	add_door(2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_children():
		if child.get_node("IsClosedComponent").is_closed():
			if child.get_node("LevelNumberComponent").get_level_number() == get_parent().get_current_floor():
				child.play("opening")
				child.get_node("IsClosedComponent").set_is_closed(false)
		else:
			if child.get_node("LevelNumberComponent").get_level_number() != get_parent().get_current_floor():
				child.play("closing")
				child.get_node("IsClosedComponent").set_is_closed(true)
	pass
	
func add_door(level_No: int)->void:
	var door = door_sprite_scene.instantiate()
	door.get_node("LevelNumberComponent").set_level_number(level_No)
	door.position.y -= 140 * level_No
	add_child(door) 
	if (level_No!= 0):
		door.play ("closing")
		door.get_node("IsClosedComponent").set_is_closed(true)
	
