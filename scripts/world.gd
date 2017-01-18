extends Node2D

onready var pause_menu = get_node("hud/pause_menu")

func _ready():
	pause_menu.hide()
	set_process(true)

func _process(delta):
	if (Input.is_action_pressed("ui_cancel")):
		pause_menu.show()
		get_tree().set_pause(true)
