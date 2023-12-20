extends Node2D
var placeable = 0
var inRock = 0

func _on_area_checker_body_entered(body):
	if body.is_in_group("buildingObstructer"):
		inRock = 1
func _on_area_checker_body_exited(body):
	if body.is_in_group("buildingObstructer"):
		inRock = 0
func _process(delta):
	if inRock == 1:
		placeable = 0
		$ColorRect.visible = true
	if inRock == 0:
		placeable = 1
		$ColorRect.visible = false

