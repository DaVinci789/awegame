# menu.gd
extends VBoxContainer

onready var start_game = get_node("play_game")
onready var quit_game  = get_node("stop_game")

func _ready():
	set_pause_mode(false)
	start_game.connect("pressed", self, "_start_game")
	quit_game.connect("pressed", self, "_quit_game")

func _start_game():
	get_tree().change_scene("res://world.tscn.xml")
	self.queue_free()
	
func _quit_game():
	self.queue_free()
	get_tree().quit()