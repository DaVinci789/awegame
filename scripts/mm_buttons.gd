extends HBoxContainer

onready var start_button = get_node("start")
onready var quit_button  = get_node("quit")

func _ready():
	start_button.connect("pressed", self, "_start_game")
	quit_button.connect("pressed", self, "_quit_game")

func _start_game():
	get_tree().change_scene("res://scenes/world.tscn")
	self.queue_free()

func _quit_game():
	get_tree().quit()
	self.queue_free()
