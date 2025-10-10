extends AnimatedSprite2D
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}
# current floor heading to
var currentFloor = 0
# current floor at. if not at a floor = -100
var currentFloorPosition = 0
var maxFloor = 1
var new_velocity = 0
var initial_child_count = 0
var max_capacity = 4
@export var material_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentFloor = get_parent().get_current_floor()
	new_velocity = get_parent().get_velocity_y()
	position.y += delta * 200 * new_velocity
	
	var test = position.y + (140 * currentFloor)
	
		
	if (test  < 533 + 10)&& (test > 533) :
		get_parent().get_parent().get_node("WorkerCollection").set_all_workers_not_stopped(currentFloor)
		new_velocity = 0
		get_parent().set_velocity_y(0)
		position.y = 533 -(140 * currentFloor)
		currentFloorPosition = currentFloor
	

	if (get_child_count()>initial_child_count):
		var material_placeholder  = get_child(initial_child_count-1) 
		if (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.STEEL):
			material_placeholder.position = Vector2(-4.5,-4.0)
			material_placeholder.scale = Vector2(0.45,0.45)
		elif (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.CABLE):
			material_placeholder.position = Vector2(-5.0,-4.0)
			material_placeholder.scale = Vector2(0.3,0.3)
	
	if (get_child_count()>initial_child_count+1):
		var material_placeholder  = get_child(initial_child_count) 
		if (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.STEEL):
			material_placeholder.position = Vector2(5.5,-4.0)
			material_placeholder.scale = Vector2(0.45,0.45)
		elif (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.CABLE):
			material_placeholder.position = Vector2(5.0,-4.0)
			material_placeholder.scale = Vector2(0.3,0.3)
			
	if (get_child_count()>initial_child_count+2):
		var material_placeholder  = get_child(initial_child_count+1) 
		if (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.STEEL):
			material_placeholder.position = Vector2(-4.5,7.0)
			material_placeholder.scale = Vector2(0.45,0.45)
		elif (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.CABLE):
			material_placeholder.position = Vector2(-5.0,7.0)
			material_placeholder.scale = Vector2(0.3,0.3)
			
	if (get_child_count()>initial_child_count+3):

		var material_placeholder  = get_child(initial_child_count+2) 
		if (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.STEEL):
			material_placeholder.position = Vector2(5.5,7.0)
			material_placeholder.scale = Vector2(0.45,0.45)
		elif (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.CABLE):
			material_placeholder.position = Vector2(5.0,7.0)
			material_placeholder.scale = Vector2(0.3,0.3)
	
	get_parent().set_velocity_y(new_velocity)
	
func setMaxFloor(newMaxFloor) -> void:
	maxFloor = newMaxFloor


func getCurrentFloor() -> int:
	return currentFloor
	
func get_current_floor_position() -> int:
	return currentFloorPosition 
	
func getVelocity() -> int:
	return new_velocity
	
func has_materials() -> bool:
	return get_child_count() > 0
	
func get_material_child() -> Node:
	return get_child(get_child_count()-1)
	
func get_max_capacity() -> int:
	return max_capacity
	
func get_initial_child_count() -> int:
	return initial_child_count
	

	
