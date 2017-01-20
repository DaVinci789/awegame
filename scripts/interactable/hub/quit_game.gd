
extends Sprite

onready var quit_area = get_node("quit_game_area")

func _ready():
	quit_area.connect("body_enter", self, "_on_quit_area_enter")

func _on_quit_area_enter(body):
	if (body.get_name() == "player"):
		get_tree().quit()


