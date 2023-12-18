extends Node2D

var inBUSRange = 0
var building = 0
var space_base = preload("res://scenes/space_base.tscn")
var space_base_instance = space_base.instantiate()

func _on_area_2d_body_entered(body):
	if body is Player:
		inBUSRange = 1
func _on_area_2d_body_exited(body):
	if body is Player:
		inBUSRange = 0
func _process(delta):
	if inBUSRange == 1 and Input.is_action_just_pressed("space"):
		add_child(space_base_instance)
		building = 1
	if building == 1:
		buildingPlacementMode(space_base_instance)
	else:
		pass
func buildingPlacementMode(structure):
	structure.position = get_local_mouse_position()
	if Input.is_action_just_pressed("leftClick"):
		building = 0
	
