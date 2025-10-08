extends Node2D
@export var pipeline_sprite_scene : PackedScene

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
func _process(delta: float) -> void:
	pass
