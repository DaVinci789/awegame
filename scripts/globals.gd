# globals.gd
# global variables and functions

extends Node

var player_node = null
var runner_node = null
# [x, y] positions
var player_location = [null, null]
var runner_location = [null, null]

func distance_to(n1, n2):
	return n1.get_pos().distance_to(n2.get_pos())