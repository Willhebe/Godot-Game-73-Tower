extends Node2D
@export var message_tube_sprite_scene : PackedScene
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_message_tube(true,1)
	add_message_tube(false,1)
	add_message_tube(false,0)
	
	pass # Replace with function body.

func add_message_tube(isLeft :bool, level_No :int) -> void: 
	var message_tube_sprite = message_tube_sprite_scene.instantiate()
	var horizontal_space_for_wall_sprite = 50
	if (level_No < 4): 
		horizontal_space_for_wall_sprite =0
	if (isLeft):
		message_tube_sprite.get_node("MessageTubeSprite2D").position = Vector2(587 - 5 * level_No - horizontal_space_for_wall_sprite ,720 + 100 * level_No )
		message_tube_sprite.get_node("LeftOrRightComponent").set_leftT_or_rightF(true)
	else:
		message_tube_sprite.get_node("MessageTubeSprite2D").position = Vector2(587 + 5 * level_No + horizontal_space_for_wall_sprite, 1000 + 100 * level_No)
		message_tube_sprite.get_node("LeftOrRightComponent").set_leftT_or_rightF(false)
	
	message_tube_sprite.get_node("MessageTubeSprite2D").scale = Vector2(2.0,2.0)
	message_tube_sprite.get_node("LevelNumberComponent").set_level_number(level_No)
	
	add_child(message_tube_sprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_children():
		#TODO - generalise this for multiple levels - pipelines are 5 apart vertically
		var temp_position = child.get_node("MessageTubeSprite2D").position
		var temp_velocity_y =  child.get_node("VelocityComponent").get_velocity_y()
		var temp_velocity_x = child.get_node("VelocityComponent").get_velocity_x()
		var temp_level = child.get_node("LevelNumberComponent").get_level_number()
		var horizontal_space_for_wall_sprite = 50
		if (temp_level < 4): 
			horizontal_space_for_wall_sprite =0
		
		temp_position += Vector2(delta*temp_velocity_x,delta * temp_velocity_y)
		
		if (child.get_node("LeftOrRightComponent").get_leftT_or_rightF()):
			
		
			if (temp_position.x < 582 - 400):
				temp_velocity_x = 150
				var random = RandomNumberGenerator.new()
				random.randomize()
				
				get_parent().get_parent().get_node("MaterialsNeededCollection").get_Materials_Needed(temp_level,true).add_material_needed(random.randi() %2)
		
			elif (temp_position.y > 900 + 320):
				temp_velocity_y = -150
		
			elif (temp_velocity_y < 0 && temp_position.y < 330 + 140 - 140 * temp_level && temp_position.x < 587):
				child.get_node("MessageTubeSprite2D").rotation = (PI/2)
				temp_velocity_y =  0
				temp_velocity_x = -150
				temp_position.y = 326 + 140 - 140 * temp_level 
		
			elif (temp_velocity_x > 0 && temp_position.y < 330 + 140 - 140 * temp_level && temp_position.x > 581):
				child.get_node("MessageTubeSprite2D").rotation = 0
				temp_velocity_x = 0
				temp_velocity_y = 150
				temp_position.x = 587 - 5 * temp_level - horizontal_space_for_wall_sprite
			
		# if on right do it different	
		else:
			
			
			if (temp_position.x > 587 + 5* temp_level + 400):
				temp_velocity_x = -150
				var random = RandomNumberGenerator.new()
				random.randomize()
				get_parent().get_parent().get_node("MaterialsNeededCollection").get_Materials_Needed(temp_level,false).add_material_needed(random.randi() %2)
		
		
			elif (temp_position.y > 600 + 320):
				temp_velocity_y = -150
		
			elif (temp_velocity_y < 0 && temp_position.y < 330 + 140 - 140 * temp_level && temp_position.x > 586):
				child.get_node("MessageTubeSprite2D").rotation = (PI/2)
				temp_velocity_y =  0
				temp_velocity_x = 150
				temp_position.y = 326 + 140 - 140 * temp_level 
		
			elif (temp_velocity_x < 0 && temp_position.y < 330 + 140 - 140 * temp_level&& temp_position.x < 586):
				child.get_node("MessageTubeSprite2D").rotation = 0
				temp_velocity_x = 0
				temp_velocity_y = 150
				temp_position.x = 587 + 5 * temp_level + horizontal_space_for_wall_sprite
				
				
		# assign temp variables to original - felt there were too many calls to the original slowing things down
		child.get_node("VelocityComponent").set_velocity_y(temp_velocity_y)
		child.get_node("VelocityComponent").set_velocity_x(temp_velocity_x)
		child.get_node("MessageTubeSprite2D").position = temp_position
			
	pass
