extends Node2D
@export var steel_scene : PackedScene
@export var cables_scene :PackedScene

var has_changed = true
var delta_count = 0
var no_of_steel_count = 1
var random

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var steel = steel_scene.instantiate()
	steel.position = Vector2(75.0,515.0)
	steel.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(true)
	add_child(steel)
	var steel2 = steel_scene.instantiate()
	steel2.position = Vector2(50.0,515.0)
	steel2.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(true)
	add_child(steel2)
	var cable = cables_scene.instantiate()
	cable.position = Vector2(25.0,515.0)
	cable.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(true)
	add_child(cable)
	
	pass # Replace with function body.


func has_materials() -> bool:
	
	return get_child_count() > 0
	
func get_material_child() -> Node:
	return get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (has_changed):
		for i in range (get_child_count()):
			get_child(i).get_node("MaterialOnConveyorBeltComponent").set_position_on_conveyor_belt(i)
		
	delta_count += delta
	#Add another child (Steel node on the conveyor belt if there is enough space and enough time has passed)
	if (get_child_count() < 6 && delta_count > 3):
		# reset timer
		delta_count = 0
		if (no_of_steel_count < 3):
			var steel = steel_scene.instantiate()
			steel.position = Vector2(0,515.0)
			steel.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(true)
			add_child(steel)
			no_of_steel_count +=1
		
		else:
			var cable = cables_scene.instantiate()
			cable.position = Vector2(0,515.0)
			cable.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(true)
			add_child(cable)
			random = RandomNumberGenerator.new()
			random.randomize()
			
			no_of_steel_count = random.randi() % 3 + 1
		
		has_changed = true
		
	
	
		
	pass
