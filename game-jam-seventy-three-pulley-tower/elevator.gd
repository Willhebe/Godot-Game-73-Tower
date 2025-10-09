extends Area2D
var velocity = Vector2.ZERO
var floor0IsClosed = false
var floor1IsClosed = true
var floor2IsClosed = true
var currentFloor = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	currentFloor = $ElevatorCarriage.getCurrentFloor()
	velocity.y = $ElevatorCarriage.getVelocity()
	match currentFloor:
		0:
			if !floor1IsClosed:
				$Floor1AnimatedSprite2D.play("closing")
				floor1IsClosed = true
			if !floor2IsClosed:
				$Floor2AnimatedSprite2D.play("closing")
				floor2IsClosed = true
			if floor0IsClosed:
				$Floor0AnimatedSprite2D.play("opening")
				floor0IsClosed = false	
		1:
			if !floor0IsClosed:
				$Floor0AnimatedSprite2D.play("closing")
				floor0IsClosed = true
			if !floor2IsClosed:
				$Floor2AnimatedSprite2D.play("closing")
				floor2IsClosed = true
			if floor1IsClosed:
				$Floor1AnimatedSprite2D.play("opening")
				floor1IsClosed = false	
		2:
			if !floor0IsClosed:
				$Floor0AnimatedSprite2D.play("closing")
				floor0IsClosed = true
			if !floor1IsClosed:
				$Floor1AnimatedSprite2D.play("closing")
				floor1IsClosed = true
			if floor2IsClosed:
				$Floor2AnimatedSprite2D.play("opening")
				floor2IsClosed = false	
	
	
	if (velocity.y == 0):
		$PulleyAnimatedSprite2D.play("steady")
		$CablesAnimatedSprite2D.play("steady")
		$CablesAnimatedSprite2D2.play("steady")
		$CablesAnimatedSprite2D3.play("steady")
		$CablesAnimatedSprite2D4.play("steady")
		$CablesAnimatedSprite2D5.play("steady")
		$CablesAnimatedSprite2D6.play("steady")
		
		
	if (velocity.y > 0):
		
		$PulleyAnimatedSprite2D.animation = "up"
		$CablesAnimatedSprite2D.animation = "up"
		$CablesAnimatedSprite2D2.animation = "up"
		$CablesAnimatedSprite2D3.animation = "up"
		$CablesAnimatedSprite2D4.animation = "up"
		$CablesAnimatedSprite2D5.animation = "up"
		$CablesAnimatedSprite2D6.animation = "up"
		
	elif (velocity.y < 0):
		$PulleyAnimatedSprite2D.animation = "down"
		$CablesAnimatedSprite2D.animation = "down"
		$CablesAnimatedSprite2D2.animation = "down"
		$CablesAnimatedSprite2D3.animation = "down"
		$CablesAnimatedSprite2D4.animation = "down"
		$CablesAnimatedSprite2D5.animation = "down"
		$CablesAnimatedSprite2D6.animation = "down"
		
			
			
	else:
		$PulleyAnimatedSprite2D.animation = "steady"
		$CablesAnimatedSprite2D.animation = "steady"
		$CablesAnimatedSprite2D2.animation = "steady"
		$CablesAnimatedSprite2D3.animation = "steady"
		$CablesAnimatedSprite2D4.animation = "steady"
		$CablesAnimatedSprite2D5.animation = "steady"
		$CablesAnimatedSprite2D6.animation = "steady"



func _on_textured_up_button_pressed() -> void:
	velocity.y = 1 
	

func _on_texture_down_button_pressed() -> void:
	velocity.y = -1
