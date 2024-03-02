extends Node2D


@onready var path = preload("res://Stage1.tscn")
@onready var path2 = preload("res://Stage2.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
	tempPath  = path2.instantiate()
	add_child(tempPath)
