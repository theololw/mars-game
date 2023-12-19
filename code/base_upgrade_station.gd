extends Node2D
var inBUSRange = 0
var building = 0
var selecting = 0
var structureNumber = 0
var structure
var overworld = preload("res://scenes/overworld.tscn")
var space_base = preload("res://scenes/space_base.tscn")
var space_base_instance = space_base.instantiate()
var lander = preload("res://scenes/lander.tscn")
var lander_instance = lander.instantiate()
@onready var structure_select = $StructureSelect
var physicsBody


func _ready():
	structure_select.visible = false
	
func _on_area_2d_body_entered(body):
	if body is Player:
		inBUSRange = 1

func _on_area_2d_body_exited(body):
	if body is Player:
		inBUSRange = 0

func _process(delta):
	if inBUSRange == 1 and Input.is_action_just_released("space") and building != 1:
		selecting = 1
		print("selectionmode")
	
	if selecting == 1:
		selectionMode()
	
	if building == 1:
		structurePlacementMode(structureNumber)
	
func selectionMode():
	structure_select.visible = true
	
	if Input.is_action_just_pressed("ui_right"):
		structureNumber += 1
	if structureNumber == 4:
		structureNumber = 0
	
	if Input.is_action_just_pressed("space"):
		building = 1
		selecting = 0
		structure_select.visible = false
	print(structureNumber)
	structure_select.frame = structureNumber

func structurePlacementMode(structureNumber):
	
	if structureNumber == 0:
		structure = lander_instance
	if structureNumber == 1:
		structure = space_base_instance
	
	structure.position = get_local_mouse_position().snapped(Vector2(32,32))
	
	add_child(structure)
	
	physicsBody = structure.get_node("StaticBody2D")
	physicsBody.collision_layer = 0
	
	if Input.is_action_just_pressed("leftClick"):
		physicsBody.collision_layer = 1
		building = 0
		
#	print("placing")
