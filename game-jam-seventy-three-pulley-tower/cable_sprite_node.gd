extends Node2D
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}

# scale 1 in main_game
# scale 0.45 when in elevator_carriage
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("MaterialNameComponent").set_material_name(Materials.CABLE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _draw() -> void:
	pass
	
	
