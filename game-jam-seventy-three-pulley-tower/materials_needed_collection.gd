extends Node2D
@export var materials_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var material_needed = materials_scene.instantiate()
	material_needed.position = Vector2 (45.0,334.0)
	add_child(material_needed)
	material_needed.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
	material_needed.set_materials_needed_amount()
	
	material_needed = materials_scene.instantiate()
	material_needed.position = Vector2 (1045.0,334.0)
	material_needed.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
	
	add_child(material_needed)
	material_needed.set_materials_needed_amount()
	
	material_needed = materials_scene.instantiate()
	material_needed.position = Vector2 (1045.0,475.0)
	material_needed.set_floor(0)
	material_needed.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
	add_child(material_needed)
	material_needed.set_materials_needed_amount()
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func get_Materials_Needed(floorY: int, onLeft: bool) -> RichTextLabel:
	for child in get_children():
		if child.get_floor() == floorY:
			if child.get_node("LeftOrRightComponent").get_leftT_or_rightF() == onLeft:
				return child 
	return null
