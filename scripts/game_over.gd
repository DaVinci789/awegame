# game_over.gd
# Script used to control game over sequences

onready var score = get_node("vertical/score")

onready var btn_main_menu = get_node("vertical/btn_container/main_menu")
onready var btn_restart   = get_node("vertical/btn_container/restart")
onready var txt_score     = get_node("vertical/score")

func _ready():
	btn_main_menu.connect("pressed", self, "_on_btn_main_menu_pressed")
	btn_restart.connect("pressed", self, "_on_btn_restart_pressed")
	
	if (global.player_score != 1):
		txt_score.set_text(str(global.player_score) + " points")
	else:
		txt_score.set_text("1 point")

func _on_btn_main_menu_pressed():
	get_tree().change_scene("res://menu.xml")
	self.queue_free()

func _on_btn_restart_pressed():
	get_tree().change_scene("res://world.tscn.xml")
	global.player_score = 0
	self.queue_free()