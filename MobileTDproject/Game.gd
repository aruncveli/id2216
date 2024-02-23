extends Node


var Sun = 100
var Health = 10

func _process(delta):
	if Health <= 0:
		get_tree().change_scene_to_file("res://GameOver.tscn")
	
