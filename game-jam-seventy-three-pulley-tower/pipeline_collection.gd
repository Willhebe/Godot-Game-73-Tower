extends Node2D
@export var pipeline_sprite_scene : PackedScene
var spritesize = 32.0
var n_sprite_horizontally = 6
var n_sprite_vertically = 6
var distance_between_levels = 140

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#level 1 piepline
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func add_pipelines(level_No :int) -> void:
	var horizontal_space_for_wall_sprite = 48.0
	
	if (level_No < 4): 
		horizontal_space_for_wall_sprite =0
	var pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.position = Vector2(585 + 5 * level_No + horizontal_space_for_wall_sprite ,480 + spritesize * 2 * (n_sprite_vertically+level_No) - distance_between_levels * level_No )
	pipeline_sprite.scale = Vector2(1.0,(n_sprite_vertically+level_No)*4 + 1 )
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.rotation = PI/2 
	pipeline_sprite.position = Vector2(585 + 2.5 * level_No + spritesize *6.5 + horizontal_space_for_wall_sprite/2 ,480 - spritesize * 0.5 - distance_between_levels  * level_No )
	pipeline_sprite.scale = Vector2(1.0,2*(n_sprite_horizontally)+1 -(horizontal_space_for_wall_sprite+5*level_No)/spritesize)
	add_child(pipeline_sprite)
	
	if (level_No >0):
		pipeline_sprite = pipeline_sprite_scene.instantiate()
		pipeline_sprite.position = Vector2(585 - 5 * level_No - horizontal_space_for_wall_sprite ,480 + spritesize * 2 * (n_sprite_vertically+level_No) - distance_between_levels * level_No )
		pipeline_sprite.scale = Vector2(1.0,(n_sprite_vertically+level_No)*4 + 1 )
		add_child(pipeline_sprite)
	
		pipeline_sprite = pipeline_sprite_scene.instantiate()
		pipeline_sprite.rotation = PI/2 
		pipeline_sprite.position = Vector2(585 - 2.5 * level_No - spritesize *6.5 -horizontal_space_for_wall_sprite/2,480 - spritesize * 0.5 - distance_between_levels  * level_No)
		pipeline_sprite.scale = Vector2(1.0,2*(n_sprite_horizontally)+1 - (horizontal_space_for_wall_sprite+5*level_No)/spritesize)
		add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.position = Vector2(585 ,480 + 160 )
	pipeline_sprite.scale = Vector2(1.0,11.0)
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.rotation = PI/2 
	pipeline_sprite.position = Vector2(585 + 192 + 16 ,480 - 16)
	pipeline_sprite.scale = Vector2(1.0,13.0)
	add_child(pipeline_sprite)
	
	pass # Replace with function body.
