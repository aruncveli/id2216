extends Node


var Sun = 100
var Health = 10
var numberPath = 10
var numberPath2 = 10
var live_enemies_count = 0
var points = 0
var lvl2 = false

func _process(delta):
	if Health <= 0:
		get_tree().change_scene_to_file("res://GameOver.tscn")
	elif points >= 30 and lvl2 == false:
		get_tree().change_scene_to_file("res://LevelFinish.tscn")
		points = 0
		Health = 10
		Sun = 100
		lvl2 = true
	elif points >= 30 and lvl2 == true:
		get_tree().change_scene_to_file("res://Level2Finish.tscn")
	
	
