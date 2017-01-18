extends Control

onready var continue_button = get_node("button_holder/continue")
onready var return_button = get_node("button_holder/return")

func _ready():
	globals.pause_node = self
	continue_button.connect("pressed", self, "_on_continue_pressed")
	return_button.connect("pressed", self, "_on_return_pressed")

func _on_continue_pressed():
	self.hide()
	get_tree().set_pause(false)

func _on_return_pressed():
	self.hide()
	get_tree().set_pause(false)
	get_tree().change_scene("res://scenes/main_menu.tscn")