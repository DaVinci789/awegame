extends KinematicBody2D

export (int) var speed = 0

var current_animation
var last_animation
onready var anim = get_node("player_anim") 

func _ready():
	set_process(true)

func _process(delta):
	update()
	globals.player_node = self
	last_animation = current_animation
	if (Input.is_action_pressed("ui_down")):
		move(Vector2(0, speed))
		current_animation = "walk_down"
	elif (Input.is_action_pressed("ui_up")):
		move(Vector2(0, -speed))
		current_animation = "walk_forward"
	elif (Input.is_action_pressed("ui_right")):
		move(Vector2(speed, 0))
		current_animation = "walk_right"
	elif (Input.is_action_pressed("ui_left")):
		move(Vector2(-speed, 0))
		current_animation = "walk_left"
	else:
		last_animation = null
		anim.stop()
	
	if (current_animation != last_animation):
		#print(current_animation)
		anim.set_speed(2)
		anim.play(current_animation)

func _draw():
	#draw_line(Vector2(0,0), Vector2(atan(globals.runner_node.get_pos()[0] - self.get_pos()[0]) * 50, atan(globals.runner_node.get_pos()[1] - self.get_pos()[1] * 50)), Color(255, 0, 0), 1)
	var rpos = globals.runner_node.get_global_pos()
	var self_gtrans = self.get_global_transform()
	var plocal = self_gtrans.xform_inv(rpos)
	
	draw_line(Vector2(0,0), plocal, Color(255, 0, 0))