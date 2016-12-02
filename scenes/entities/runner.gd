# runner.gd
# script for the thing that the player is chasing

extends KinematicBody2D

var speed
export (int) var speed_vals_min = 5
export (int) var speed_vals_max = 10

onready var runner_area = get_node("runner_area")

func _ready():
	runner_area.connect("body_enter", self, "_on_area_hit")
	
	randomize()
	speed = rand_range(speed_vals_min, speed_vals_max)
	set_process(true)

func _process(delta):
	#print(speed)
	
	if (Input.is_action_pressed("ui_up")):
		move(Vector2(0, -speed))
	elif (Input.is_action_pressed("ui_down")):
		move(Vector2(0, speed))
	elif (Input.is_action_pressed("ui_left")):
		move(Vector2(-speed, 0))
	elif (Input.is_action_pressed("ui_right")):
		move(Vector2(speed, 0))

func _on_area_hit(body):
	if (body.get_name() == "player"):
		print("ok! hit.")