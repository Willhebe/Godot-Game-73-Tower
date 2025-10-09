extends RichTextLabel
enum Materials {STEEL,CABLE,GLASS,CONCRETE,PIPES}
var amountMaterialsNeeded = {
	Materials.STEEL : 4,
	Materials.CABLE : 3,
	Materials.GLASS : 0,
	Materials.CONCRETE : 2,
	Materials.PIPES : 0
}
var hasChanged = false
var onLeft = true
var floorY = 1
var random

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (hasChanged):
		update_text()
	
	
func update_text() -> void:
	text = ""
	if (amountMaterialsNeeded[Materials.STEEL]>1):
		text += "          : "+  str(amountMaterialsNeeded[Materials.STEEL]) + "\n"
	else:
		text += "\n"
	if (amountMaterialsNeeded[Materials.CABLE]>1):
		text += "          : "+  str(amountMaterialsNeeded[Materials.CABLE]) + "\n"
	else:
		text += "\n"
	
	hasChanged = false
	
func remove_material(material_name : int) -> bool:
	var willReturnTrueIfMaterialReduced = false
	if (amountMaterialsNeeded[material_name]>0):
		amountMaterialsNeeded[material_name] -=1
		willReturnTrueIfMaterialReduced = true
	if (amountMaterialsNeeded[material_name] == 0):
		if (material_name == Materials.STEEL):
			$SteelSpriteNode.set_visible(false)
		elif (material_name == Materials.CABLE):
			$CableSpriteNode.set_visible(false)
		pass
	
	hasChanged = true
	return willReturnTrueIfMaterialReduced
	
func set_on_left(isOnleft  :bool) -> void :
	get_node("LeftOrRightComponent").set_leftT_or_rightF(isOnleft)
	
func get_on_left() -> bool:
	return get_node("LeftOrRightComponent").get_leftT_or_rightF()
	
func set_floor(floorNum : int) -> void:
	floorY = floorNum 

	
func get_floor() -> int:
	return floorY
	
func set_materials_needed_amount() -> void:
	random = RandomNumberGenerator.new()
	random.randomize()
	
	
	
	var otherSide = get_parent().get_Materials_Needed(floorY,!onLeft)
	
	if (floorY == 0):
		amountMaterialsNeeded[Materials.STEEL] = 5 
		amountMaterialsNeeded[Materials.CABLE] = 3 
		
	elif (otherSide == null):
		amountMaterialsNeeded[Materials.STEEL] = random.randi() % 5 + 3
		amountMaterialsNeeded[Materials.CABLE] = random.randi() % 4 + 2
		
	else:
		amountMaterialsNeeded[Materials.STEEL] = 10 - otherSide.get_amount_materials_needed(Materials.STEEL)
		amountMaterialsNeeded[Materials.CABLE] = 8 - otherSide.get_amount_materials_needed(Materials.CABLE)
	
	text =  "          : " +  str(amountMaterialsNeeded[Materials.STEEL]) #+ "\n" + Materials.keys()[Materials.CABLE] + " : " +  str(amountMaterialsNeeded[Materials.CABLE])
	if (amountMaterialsNeeded[Materials.CABLE] >1):
		text +=  "\n          : " +  str(amountMaterialsNeeded[Materials.CABLE]) #+ "\n" + Materials.keys()[Materials.CABLE] + " : " +  str(amountMaterialsNeeded[Materials.CABLE])
	
	#print(text) 

func get_amount_materials_needed(material_name: int) -> int:
	return amountMaterialsNeeded[material_name]
	
func reduce_material_needed(material_to_be_processed: int) -> void:
	if (amountMaterialsNeeded[material_to_be_processed] > 0):
		amountMaterialsNeeded[material_to_be_processed] -= 1
		update_text()
		
func add_material_needed(material_to_be_processed :int) -> void:
	amountMaterialsNeeded[material_to_be_processed] +=1
	update_text()
		
	if (amountMaterialsNeeded[material_to_be_processed] == 1):
		if (material_to_be_processed == Materials.STEEL):
			$SteelSpriteNode.set_visible(true)
		elif (material_to_be_processed == Materials.CABLE):
			$CableSpriteNode.set_visible(true)
	
	
	
