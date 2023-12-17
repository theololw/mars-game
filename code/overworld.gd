extends Node2D

var rock_scene = preload("res://scenes/rock.tscn")
var num_rocks = 50

func _ready():
	generate_rocks()
func generate_rocks():
	for i in num_rocks:
		generate_single_rock()
func generate_single_rock():
	var rock_position = generate_random_position()

	var new_rock = rock_scene.instantiate()
	new_rock.position = rock_position
	add_child(new_rock)
func generate_random_position():
	var min_x = -10
	var max_x = 10
	var min_y = -10
	var max_y = 10
	
	var rockYpos = randi_range(min_y,max_y)
	var rockXpos = randi_range(min_x,max_x)
	return Vector2(rockXpos * 128 + 64, rockYpos * 128 + 64)
