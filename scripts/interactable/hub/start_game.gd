extends Sprite

onready var start_area = get_node("start_game_area")

func _ready():
	start_area.connect("body_enter", self, "_on_start_area_entered")

func _on_start_area_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("res://scenes/world.tscn")