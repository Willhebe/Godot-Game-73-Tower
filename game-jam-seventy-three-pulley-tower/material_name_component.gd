extends Node2D
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}
var materialName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_material_name(m_name: int) -> void:
	materialName = m_name
	
func get_material_name() -> int:
	return materialName
	
