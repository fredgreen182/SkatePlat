extends KinematicBody2D

#Constants
const UP = Vector2(0,-1)
const GRAVITY = 20
const JUMP_HEIGHT = -700
const GROUND_DRAG = 0.02
const MAX_SPEED = 5000
const ACCELERATION = 250

#Variables
var motion = Vector2()
var drag_multiplier = 1

func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("jump"):
		jump()
	if Input.is_action_pressed("ui_left"):
		if(drag_multiplier > 0.8):
			drag_multiplier -= 0.01
		skate("left")
	if Input.is_action_pressed("ui_right"):
		if(drag_multiplier > 0.8):
			drag_multiplier -= 0.01
		skate("right")
	if Input.is_action_pressed("ui_down"):
		if drag_multiplier <=5:
			drag_multiplier += 0.15
	if Input.is_action_just_released("ui_down"):
		drag_multiplier = 1
	if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
		drag_multiplier = 2
	if is_on_floor():
		motion.x = lerp(motion.x, 0, GROUND_DRAG * drag_multiplier)
	motion = move_and_slide(motion, UP)

func jump():
	if is_on_floor():
		motion.y = JUMP_HEIGHT
		
		
func skate(dir):
	if $Timer.is_stopped() && is_on_floor():
		$Timer.start()
		if dir == "left":
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		elif dir == "right":
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)

func _on_Area2D_body_entered(body):
	print(body)
	
