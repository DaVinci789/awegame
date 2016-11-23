# world.gd
# Do things in the world

extends Node2D

onready var n1 = get_node("chaser")
onready var n2 = get_node("runner")
onready var pause_menu = get_node("hud/pause_container")
onready var dev_label_text = get_node("hud/vertical/important_data")
onready var score_label = get_node("hud/vertical/score")

export (int) var WIN_DISTANCE = 8

var time_til_next_jump = 180

# Timer to test for win
#var timer     = null
#var win_delay = 3
#var is_won    = false
#var win_times_called = 0

func _ready():
	get_node("chaser/player_area").connect("body_enter", self, "_set_win")
	get_node("Timer").connect("timeout", self, "_on_timer_win")
	set_process(true)
	set_process_input(true)
	dev_label_text.set_text(str(n1.speed))
	score_label.set_text("0")

func _process(delta):
	dev_label_text.set_text(str(n1.speed))
	if (_distance_to(n1, n2) <= 1.9):
		pass
	print(_distance_to(n1, n2))
	#print(get_node("Timer").get_time_left())
	score_label.set_text(str(global.player_score))

func _input(delta):
	#print(distance_to(n1, n2))
	#print(_get_camera_center()[0])
	if (Input.is_action_pressed("ui_cancel")):
		print("pause menu started")
		#pause_menu.set_pos(Vector2(_get_camera_center()[0] - 500, _get_camera_center()[1] - 300))
		pause_menu.show()
		get_tree().set_pause(true)

# Misc. Functions

func _set_win(body):
	if (body.get_name() == "runner"):
		get_node("Timer").start()
	pass

func _on_timer_win():
	print("entered win cond.")
	if (_distance_to(n1, n2) <= WIN_DISTANCE):
		n2.set_pos(Vector2(n2.get_pos()[0] + rand_range(-301, 301), n2.get_pos()[1] + rand_range(-301, 301)))
		get_node("Timer").stop()
		global.player_score += 1
	else:
		print("YOU LOSE")
		self.set_pause_mode(true)
		get_tree().change_scene("res://scenes/game_over.xml")
		#get_node("Timer").stop()

# Literally just the distance formula.
# Just a style change rather than doing node1.get_pos().distance_to(node2.get_pos())
func _distance_to(p1, p2):
	#return sqrt(pow(p2.get_pos()[0] - p1.get_pos()[0], 2) + pow(p2.get_pos()[1] - p1.get_pos()[1], 2))
	return p1.get_pos().distance_to(p2.get_pos())

# Got this off of reddit. Don't question it.
# I don't know if we still need this due to CanvasLayers implemented.
func _get_camera_center():
    var vtrans = get_canvas_transform()
    var top_left = -vtrans.get_origin() / vtrans.get_scale()
    var vsize = get_viewport_rect().size
    return top_left + 0.5*vsize/vtrans.get_scale()

# Old callback functions, might be useful
func _on_continue_pressed():
	print("old")
	get_tree().set_pause(false)

func _on_end_pressed():
	print("old")
	get_tree().set_pause(false)
	get_tree().change_scene("res://menu.xml")
	
