extends Node2D
@export var worker_scene : PackedScene
var starting_number_of_workers = 4
var current_number_of_workers = 4
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#worker index 0 y 524 x 310 index 1 x 840 index 2 and 3 y 385
	var worker = worker_scene.instantiate()
	worker.position = Vector2 (310.0,524.0)
	worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
	add_child(worker)
	
	worker = worker_scene.instantiate()
	worker.position = Vector2 (840.0,524.0)
	worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
	add_child(worker)
	
	worker = worker_scene.instantiate()
	worker.position = Vector2 (310.0,385.0)
	worker.set_floor(1)
	worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
	add_child(worker)
	
	worker = worker_scene.instantiate()
	worker.position = Vector2 (840.0,385.0)
	worker.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
	worker.set_floor(1)
	add_child(worker)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	
	
	for worker in get_children():
		var isLeft = worker.get_node("LeftOrRightComponent").get_leftT_or_rightF()
		var materialsCollection = get_parent().get_node("MaterialsNeededCollection")
		var associatedMaterialNeeded = materialsCollection.get_Materials_Needed(worker.get_floor(),isLeft)
		
		
		if (!worker.has_stopped()):
			
		
			if (worker.is_stopped_on_left()):
		 
				if (worker.get_floor()==0 && isLeft && get_parent().get_node("MaterialsConveyorBeltCollection").has_materials()):
					# move instatantiated steel to Worker if there is any - take off conveyor belt
					if (worker.get_child_count() == worker.get_initial_child_count()):
						# only removes steel if worker has original number of children thus is empty of materials
						var temp_material = get_parent().get_node("MaterialsConveyorBeltCollection").get_material_child()
						get_parent().get_node("MaterialsConveyorBeltCollection").remove_child(temp_material)
						temp_material.get_node("MaterialOnConveyorBeltComponent").set_is_on_conveyor_belt(false)
						worker.add_child(temp_material)
					
				elif (!isLeft  && get_parent().get_node("Elevator/ElevatorCarriage").get_current_floor_position() == worker.get_floor()):
					if (worker.get_child_count() == worker.get_initial_child_count() && get_parent().get_node("Elevator/ElevatorCarriage").has_materials()):
						var temp_material = get_parent().get_node("Elevator/ElevatorCarriage").get_material_child()
						get_parent().get_node("Elevator/ElevatorCarriage").remove_child(temp_material)
						worker.add_child(temp_material)
					elif (worker.get_child_count() > worker.get_initial_child_count() && get_parent().get_node("Elevator/ElevatorCarriage").get_child_count() < get_parent().get_node("Elevator/ElevatorCarriage").get_initial_child_count() + get_parent().get_node("Elevator/ElevatorCarriage").get_max_capacity()):
				
						var temp_material = worker.get_child(worker.get_child_count()-1)
						worker.remove_child(temp_material)
						
						get_parent().get_node("Elevator/ElevatorCarriage").add_child(temp_material)
			
				# if on left and stopped on left worker tries to get rid of material
				elif (isLeft):
					if (worker.get_child_count() > worker.get_initial_child_count()):
						var carried_material = worker.get_child(worker.get_child_count()-1)
						worker.remove_child(carried_material)
						if (associatedMaterialNeeded!= null && isLeft==associatedMaterialNeeded.get_node("LeftOrRightComponent").get_leftT_or_rightF() && worker.get_floor() == associatedMaterialNeeded.get_floor()):
							if (associatedMaterialNeeded.remove_material(carried_material.get_node("MaterialNameComponent").get_material_name())):
								# only add to level score if there was materials needed
								LevelInfo.add_level_score(1)
						carried_material.queue_free()
				worker.set_has_stopped(true)
			
			elif (worker.is_stopped_on_right()):

				if (isLeft  && get_parent().get_node("Elevator/ElevatorCarriage").get_current_floor_position() == worker.get_floor()):
	
					if (worker.get_child_count() == worker.get_initial_child_count() && get_parent().get_node("Elevator/ElevatorCarriage").has_materials()):
				
						var steel = get_parent().get_node("Elevator/ElevatorCarriage").get_material_child()
						get_parent().get_node("Elevator/ElevatorCarriage").remove_child(steel)
						worker.add_child(steel)
					elif (worker.get_child_count() > worker.get_initial_child_count() && get_parent().get_node("Elevator/ElevatorCarriage").get_child_count() < get_parent().get_node("Elevator/ElevatorCarriage").get_initial_child_count() + get_parent().get_node("Elevator/ElevatorCarriage").get_max_capacity()):
				
						var steel = worker.get_child(worker.get_child_count()-1)
						worker.remove_child(steel)
						
						get_parent().get_node("Elevator/ElevatorCarriage").add_child(steel)
					
				elif (!isLeft):
					if (worker.get_child_count() > worker.get_initial_child_count()):
						var carried_material = worker.get_child(worker.get_child_count()-1)
						
						
						if (associatedMaterialNeeded!= null && isLeft==associatedMaterialNeeded.get_node("LeftOrRightComponent").get_leftT_or_rightF() && worker.get_floor() == associatedMaterialNeeded.get_floor()):
							if (associatedMaterialNeeded.remove_material(carried_material.get_node("MaterialNameComponent").get_material_name())):
								# only add to level score if there was materials needed
								LevelInfo.add_level_score(1)
						worker.remove_child(carried_material)
						carried_material.queue_free()
				worker.set_has_stopped(true)
				
func set_all_workers_not_stopped(floorValue : int) -> void:
	for worker in get_children():
		if (floorValue == worker.get_floor()):
			
			worker.set_has_stopped(false)
