extends Node2D

onready var pause_menu = get_node("hud/pause_menu")
onready var time_left  = get_node("game_time")
onready var timer_disp = get_node("hud/text_v/game_time_left")
onready var player_score = get_node("hud/text_v/player_score")

export (int) var play_time = 60

func _ready():
	pause_menu.hide()
	time_left.set_wait_time(play_time)
	time_left.start()
	time_left.connect("timeout", self, "_on_time_end")
	set_process(true)
	set_process_input(true)

func _process(delta):
	timer_disp.set_text(str(floor(time_left.get_time_left())))
	player_score.set_text("SCORE: " + str(get_node("player").get_player_score()))

func _input(event):
	if (event.is_action_pressed("ui_cancel")):
		pause_menu.show()
		get_tree().set_pause(true)

func _on_time_end():
	print("GAME OVER")
	get_tree().change_scene("res://scenes/main_menu.tscn")
	self.queue_free()