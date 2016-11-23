# runner.gd
# script for the entity that runs away from the player.

extends KinematicBody2D

export (int) var debug_speed = 5
export (int) var UPPER_TELEPORT_BOUNDS = 301
export (int) var LOWER_TELEPORT_BOUNDS = -301

var speed

func _ready():

	randomize_speed()
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

func randomize_speed():
	randomize()
	speed = rand_range(10, 20)

func randomize_pos():
	randomize()
	self.set_pos(Vector2(self.get_pos()[0] + rand_range(LOWER_TELEPORT_BOUNDS, UPPER_TELEPORT_BOUNDS), self.get_pos()[1] + rand_range(LOWER_TELEPORT_BOUNDS, UPPER_TELEPORT_BOUNDS)))