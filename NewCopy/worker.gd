extends Area2D
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}
@export var speed = 400
var screen_size
var velocity_value = Vector2.ZERO
var start_position = Vector2.ZERO
var initial_child_count = 4
var onLeft = true
var floorY = 0
var hasStopped = false
var inStopZone = false


 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	start_position = position
	initial_child_count = get_child_count()
	#get_parent().get_node("MaterialsNeededTextLabel").clear()
	#get_parent().get_node("MaterialsNeededTextLabel").add_text("Y" +str(position.y))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	var childcount = get_child_count()
	
	
	if velocity_value.length() > 0:
		velocity_value = velocity_value.normalized() * speed
		$AnimatedSprite2D.play()
		
		
	if position.x > start_position.x + 180:
		position.x = start_position.x + 180
		velocity_value.x = 0
		
	if (position.x < start_position.x - 140):
		$TextureLeftButton.visible = false
		
		inStopZone = true
		
	if (position.x > start_position.x - 140):
		$TextureLeftButton.visible = true
		inStopZone = false
		
	if (position.x > start_position.x + 140):
		$TextureRightButton.visible = false
		inStopZone = true

		
		
			
	if (position.x < start_position.x + 140):
		$TextureRightButton.visible = true
		inStopZone = false
		
	if (position.x > start_position.x - 160 && position.x < start_position.x + 160):
		hasStopped = false
		
	if position.x < start_position.x - 180:
		position.x = start_position.x - 180
		velocity_value.x = 0
	
		
	position += velocity_value * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if (childcount > initial_child_count):
			
			var material_placeholder  = get_child(initial_child_count) 
			if (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.STEEL):
				material_placeholder.position = Vector2(10.0,0.0)
				material_placeholder.scale = Vector2(0.45,0.45)
			elif (material_placeholder.get_node("MaterialNameComponent").get_material_name() == Materials.CABLE):
				material_placeholder.position = Vector2(10.0,0.0)
				material_placeholder.scale = Vector2(0.35,0.35)
			pass	
	
	if velocity_value.x != 0:
		$AnimatedSprite2D.animation = "walk"
	
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity_value.x > 0
		
			
	else:
		$AnimatedSprite2D.animation = "steady"
		
		


func _on_texture_right_button_pressed() -> void:
	velocity_value.x = 1 

func get_initial_child_count() -> int:
	return initial_child_count

func _on_texture_left_button_pressed() -> void:
	velocity_value.x = -1 
	
func set_on_left(isOnleft  :bool) -> void :
	onLeft = isOnleft
	
func get_on_left() -> bool:
	return onLeft
	
func set_floor(floorNum : int) -> void:
	floorY = floorNum 

	
func get_floor() -> int:
	return floorY

func has_stopped() -> bool:
	return hasStopped

func set_has_stopped(newValue : bool) -> void:
	hasStopped = newValue
	
func is_in_stop_zone() -> bool:
	return inStopZone

func is_stopped_on_left() ->bool:
	return position.x < start_position.x - 175
	
func is_stopped_on_right() -> bool:
	return position.x > start_position.x + 175
	
