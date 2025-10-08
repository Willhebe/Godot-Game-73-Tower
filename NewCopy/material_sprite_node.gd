extends Node2D
var isOnConveyorBelt
var positionOnConveyorBelt

func _ready() -> void:
	set_position_on_conveyor_belt(-1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (isOnConveyorBelt):
		get_parent().position.x += (delta * 50)
		if (get_parent().position.x > 170 - positionOnConveyorBelt * 25) :
			get_parent().position.x = 170 - positionOnConveyorBelt * 25
	pass

func set_is_on_conveyor_belt(isOn : bool) -> void:
	isOnConveyorBelt = isOn

func set_position_on_conveyor_belt(positionNo : int) -> void:
	positionOnConveyorBelt = positionNo
	
func get_is_on_conveyor_belt() -> bool:
	return isOnConveyorBelt
	
func get_position_on_conveyor_belt() -> int:
	return positionOnConveyorBelt

func _draw() -> void:
	pass
	
