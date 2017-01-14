# runner.gd
# script for the thing that the player is chasing

extends KinematicBody2D

var speed
export (int) var speed_vals_min = 10
export (int) var speed_vals_max = 15
export (int) var teleport_range = 150

onready var runner_area = get_node("runner_area")
onready var runner_tele = get_node("runner_teleport")

func _ready():
	runner_area.connect("body_enter", self, "_on_area_hit")
	runner_tele.connect("timeout", self, "_on_tele_start")
	
	globals.runner_node = self
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
		runner_tele.start()

func _on_tele_start():
	randomize()
	var tele_x = rand_range(-teleport_range, teleport_range)
	var tele_y = rand_range(-teleport_range, teleport_range)
	if (globals.distance_to(self, globals.player_node) <= teleport_range):
		# Use a variable here for teleport_range?
		self.set_pos(Vector2(self.get_pos()[0] + tele_x, \
		                     self.get_pos()[1] + tele_y))
		print(self.get_pos())
		runner_tele.stop()
	else:
		print("GAME OVER")
		get_tree().set_pause(true)