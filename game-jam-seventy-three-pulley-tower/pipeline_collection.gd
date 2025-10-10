extends Node2D
@export var pipeline_sprite_scene : PackedScene
var spritesize = 32

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#level 1 piepline
	
	var pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.position = Vector2(580 ,340 + 160 )
	pipeline_sprite.scale = Vector2(1.0,11.0)
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.rotation = PI/2 
	pipeline_sprite.position = Vector2(580 - 192 - 16 ,340 - 16)
	pipeline_sprite.scale = Vector2(1.0,13.0)
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.position = Vector2(590 ,340 + 160 )
	pipeline_sprite.scale = Vector2(1.0,11.0)
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.rotation = PI/2 
	pipeline_sprite.position = Vector2(590 + 192 + 16 ,340 - 16)
	pipeline_sprite.scale = Vector2(1.0,13.0)
	add_child(pipeline_sprite)
	
	#level 0 pipeline - only needs 1 side
	
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func add_pipelines(level_No :int) -> void:
	var pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.position = Vector2(585 + 5 * level_No ,480 + spritesize * 5 - 140 * level_No )
	pipeline_sprite.scale = Vector2(1.0,11.0)
	#set_visible(false)
	add_child(pipeline_sprite)
	
	pipeline_sprite = pipeline_sprite_scene.instantiate()
	pipeline_sprite.rotation = PI/2 
	pipeline_sprite.position = Vector2(585 + 5 * level_No + spritesize *6 + 16 ,480 - spritesize * 0.5 - 140  * level_No )
	pipeline_sprite.scale = Vector2(1.0,13.0)
	#set_visible(false)
	add_child(pipeline_sprite)
	
