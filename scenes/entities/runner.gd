# runner.gd
# script for the thing that the player is chasing

extends KinematicBody2D

var speed
export (int) var speed_vals_min = 10
export (int) var speed_vals_max = 15
export (int) var teleport_range = 400

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
	#var tele_x = floor(rand_range(400, teleport_range))
	var tele_x = randex(range(-100, 100))
	print(tele_x)
	#var tele_y = floor(rand_range(400, teleport_range))
	var tele_y = randex(range(-100, 100))
	print(tele_y)

	if (globals.distance_to(self, globals.player_node) <= teleport_range):
		# Use a variable here for teleport_range?
		self.set_pos(Vector2(self.get_pos()[0] + tele_x, \
		                     self.get_pos()[1] + tele_y))
		print(self.get_pos())
		runner_tele.stop()
		self.speed = rand_range(self.speed_vals_min, self.speed_vals_max)
	else:
		print("GAME OVER")
		get_tree().set_pause(true)

func randex(exclude):
	# Take a random number, R, and map it against the amount of EXCLUDEd numbers.
	# This results in getting a random number that is not in EXCLUDE.
	# This function also only works when the exclude range is exactly in the middle of
	# random numbers generated.
	# But this is okay for making sure that the runner doesn't get into the wrong range.
	randomize()
	var r = floor(rand_range(-teleport_range, teleport_range - exclude.size()))
	print("foop: " + str(teleport_range))
	#while r in exclude:
	#	r += 1
	print("r is " + str(r))
	if r > -100:
		r += exclude.size()
	return r