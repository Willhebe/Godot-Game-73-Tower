extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
#taken from https://www.reddit.com/r/godot/comments/gtrjkg/comment/fseeyvw/ 
# modified. See if Class holds this function if so dont scroll
func dont_scroll(what) -> int:
	return "Node" == what
