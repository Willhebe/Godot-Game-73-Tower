extends Node2D
var velocity = Vector2.ZERO
var floor0IsClosed = false
var floor1IsClosed = true
var floor2IsClosed = true
var currentFloor = 0
var maxFloor = 1
var distance_between_cable_sprites = 86



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if (velocity.y == 0):
		$PulleyAnimatedSprite2D.play("steady")
		get_node("CablesCollection").play("steady")
		
		
		
	if (velocity.y > 0):
		
		$PulleyAnimatedSprite2D.animation = "up"
		get_node("CablesCollection").play("up")
		
	elif (velocity.y < 0):
		$PulleyAnimatedSprite2D.animation = "down"
		get_node("CablesCollection").play("down")
			
			
	else:
		$PulleyAnimatedSprite2D.animation = "steady"
		get_node("CablesCollection").play("steady")


func _on_textured_up_button_pressed() -> void:
	velocity.y = -1 
	if currentFloor < maxFloor:
		currentFloor += 1
	else:
		velocity.y  = 0

	

func _on_texture_down_button_pressed() -> void:
	velocity.y = 1
	if currentFloor > 0:
		currentFloor -= 1
	else:
		velocity.y =0
		
func get_current_floor() -> int:
	return currentFloor
	
func set_current_floor(new_floor:int)->void:
	currentFloor = new_floor
		
func get_velocity_y()-> int:
	return velocity.y
	
func set_velocity_y(new_velocity:int)->void:
	velocity.y = new_velocity
		
func setMaxFloor(newMaxFloor) -> void:
	maxFloor = newMaxFloor

func add_cables_raise_pulley()->void:
	$PulleyAnimatedSprite2D.position.y -=140
