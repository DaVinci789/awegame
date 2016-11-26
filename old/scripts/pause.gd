# pause.gd
# controls for pausing the game.
extends Panel

onready var bcontinue = get_node("pause_vbox/continue_button")
onready var bquit     = get_node("pause_vbox/end_button")
onready var breload   = get_node("pause_vbox/reload_button")

func _ready():
	self.hide()
	bcontinue.connect("pressed", self, "_on_continue_clicked")
	bquit.connect("pressed", self, "_on_end_clicked")
	breload.connect("pressed", self, "_on_reload_clicked")
	set_fixed_process(true)

func _fixed_process():
	pass

func _on_continue_clicked():
	self.hide()
	get_tree().set_pause(false)
	print("ash")

func _on_end_clicked():
	self.hide()
	get_tree().change_scene("res://menu.xml") # Goto main menu
	self.queue_free()
	print("mep")

func _on_reload_clicked():
	self.hide()
	get_tree().reload_current_scene() # Basically the world scene
	get_tree().set_pause(false)