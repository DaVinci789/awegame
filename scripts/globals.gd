# globals.gd
# global variables and functions

extends Node

var player_node = null
var runner_node = null
var pause_node  = null
var high_score  = 0 setget set_high_score, get_high_score

func distance_to(n1, n2):
	return n1.get_pos().distance_to(n2.get_pos())

func randex(lower_bounds, upper_bounds, exclude):
	# Take a random number, R, and map it against the amount of EXCLUDEd numbers.
	# This results in getting a random number that is not in EXCLUDE.
	# This function also only works when the exclude range is exactly in the middle of
	# random numbers generated.
	# But this is okay for making sure that the runner doesn't get into the wrong range.
	randomize()
	var r = floor(rand_range(lower_bounds, upper_bounds - exclude.size()))
	if r > -exclude.size() / 2:
		r += exclude.size()
	return r

func set_high_score(amt):
	if amt > high_score:
		high_score = amt

func get_high_score():
	return high_score