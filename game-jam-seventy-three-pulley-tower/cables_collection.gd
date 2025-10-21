extends Node2D
@export var cable_sprite_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var cable_sprite = cable_sprite_scene.instantiate()
	add_child(cable_sprite)
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86
	add_child(cable_sprite)
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * 2
	add_child(cable_sprite)
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * 3
	add_child(cable_sprite)
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * 4
	add_child(cable_sprite)
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * 5
	add_child(cable_sprite)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func play(animation_string)-> void:
	for child in get_children():
		child.play(animation_string)
		
func add_new_level_cable_sprites(level_no:int)->void:
	for child in get_children():
		child.position.y -=140
	
	var cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * ( 2 *  level_no + 2) - 140 * (level_no - 1)
	add_child(cable_sprite)
	
	cable_sprite = cable_sprite_scene.instantiate()
	cable_sprite.position.y += 86 * (2 * level_no + 3) - 140 * (level_no - 1)
	add_child(cable_sprite)
