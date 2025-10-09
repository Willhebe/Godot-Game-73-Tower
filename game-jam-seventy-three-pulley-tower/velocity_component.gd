extends Node
var velocity_x = 0
var velocity_y = -150

func get_velocity_x()-> float:
	return velocity_x

func get_velocity_y()-> float:
	return velocity_y
	
func set_velocity_x(new_velocity : float ) -> void:
	velocity_x = new_velocity

	
func set_velocity_y(new_velocity : float ) -> void:
	velocity_y = new_velocity
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
