extends Node2D
var BUS = preload("res://scenes/base_upgrade_station.tscn")
var health : int = 3
var inRockRange = 0
func _ready() -> void:
	pass
func _on_area_2d_body_entered(body):
	if body is Player:
		inRockRange = 1
func _on_area_2d_area_entered(area):
	if area.is_in_group("RockRemover"):
		queue_free()
func _on_area_2d_body_exited(body):
	if body is Player:
		inRockRange = 0
func _process(_delta):
	if inRockRange == 1 and Input.is_action_just_pressed("space"):
		take_damage()
func take_damage() -> void:
	#destroy if health is under 0
	health -= 1
	if health <= 0:
		break_stone()
	
	#rock animation
	if health == 3:
		$StaticBody2D/Rock.frame = 0
	elif health == 2:
		$StaticBody2D/Rock.frame = 1
	elif health == 1:
		$StaticBody2D/Rock.frame = 2
func break_stone() -> void:
	# Implement logic for breaking the stone
	queue_free()  # This example simply frees the stone node, you may want to play an animation or spawn debris


