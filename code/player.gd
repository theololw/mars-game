extends CharacterBody2D
class_name Player
var speed = 250  # speed in pixels/sec
func movement():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if Input.is_action_pressed("right"):
		$Astronaut.flip_h = true
	if Input.is_action_pressed("left"):
		$Astronaut.flip_h = false
	if Input.get_vector("left", "right", "up", "down"):
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("RESET")
	move_and_slide()
func _physics_process(delta):
	movement()
