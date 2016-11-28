extends KinematicBody2D

export (int) var speed = 0

var current_animation
var last_animation
onready var anim = get_node("player_anim") 

func _ready():
	set_process(true)

func _process(delta):
	last_animation = current_animation
	if (Input.is_action_pressed("ui_down")):
		move(Vector2(0, speed))
		current_animation = "walk_down"
	elif (Input.is_action_pressed("ui_up")):
		move(Vector2(0, -speed))
		current_animation = "walk_forward"
	elif (Input.is_action_pressed("ui_right")):
		move(Vector2(speed, 0))
		current_animation = "walk_right"
	elif (Input.is_action_pressed("ui_left")):
		move(Vector2(-speed, 0))
		current_animation = "walk_left"
	else:
		anim.stop()
	
	if (current_animation != last_animation):
		print(current_animation)
		anim.set_speed(2)
		anim.play(current_animation)
