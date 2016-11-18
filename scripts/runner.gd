# runner.gd
# script for the entity that runs away from the player.

extends KinematicBody2D

export var debug_speed = 5
var speed

func _ready():
	randomize()
	speed = rand_range(10, 20)
	set_process(true)
	
func _process(delta):
	if Input.is_action_pressed("ui_left"):
		move(Vector2(-speed, 0))
	if Input.is_action_pressed("ui_right"):
		move(Vector2(speed, 0))
	if Input.is_action_pressed("ui_up"):
		move(Vector2(0, -speed))
	if Input.is_action_pressed("ui_down"):
		move(Vector2(0, speed))