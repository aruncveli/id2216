extends Area2D

const TREE = preload("res://Tree.tscn")
var occupied = false

func _on_input_event(_viewport, event, _shape_idx):
	if not occupied and event is InputEventMouseButton and event.pressed:
		print(event.position)
		var tree = TREE.instantiate()
		# tree.position = TREE_POSITION
		add_child(tree)
		occupied = true
		Global.coins -= 10
