# player.gd
# Movement and testing for the Player object

extends KinematicBody2D

# Editor variables
export var speed = 5

onready var area_player = get_node("player_area")

# Local variables
var screen_size
var sprite

func _ready():
	screen_size = get_viewport_rect().size
	sprite = get_node("player_sprite")
	set_process(true)
	get_tree().set_pause(false)
	
func _process(delta):
	if (is_colliding()):
		print("HAIHsd")
	_move_player()
	global.player_location = [self.get_pos()[0], self.get_pos()[1]]

func _move_player():
	var x = get_pos()[0]
	var y = get_pos()[1]
	
	if Input.is_action_pressed("ui_left"):
		sprite.set_flip_h(true)
		move(Vector2(-speed, 0))
	if Input.is_action_pressed("ui_right"):
		sprite.set_flip_h(false)
		move(Vector2(speed, 0))
	if Input.is_action_pressed("ui_up"):
		move(Vector2(0, -speed))
	if Input.is_action_pressed("ui_down"):
		move(Vector2(0, speed))

func _on_player_area_body_enter( body ):
	print("IN RANGE")
