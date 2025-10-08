extends Node2D
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}
var slot1position = Vector2.ZERO
var slot2position = Vector2.ZERO + Vector2(50.0,0.0)
var slot3position = Vector2.ZERO + Vector2(50.0,50.0)
var slot4position = Vector2.ZERO + Vector2(0.0,50.0)

# scale 1 in main_game
# scale 0.45 when in elevator_carriage
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("MaterialNameComponent").set_material_name(Materials.STEEL)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _draw() -> void:
	pass
	
	
