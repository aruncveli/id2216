extends Node


var Sun = 100
var Health = 10
var numberPath = 10
var numberPath2 = 10
var live_enemies_count = 0
var points = 0

func _process(delta):
	if Health <= 0:
		get_tree().change_scene_to_file("res://GameOver.tscn")
	elif points >= 30:
		get_tree().change_scene_to_file("res://LevelFinish.tscn")
	
	
