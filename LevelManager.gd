extends Node2D

@export var enemyAsset: PackedScene

func _on_enemy_spawn():
	var enemy = enemyAsset.instantiate()
	$Path2D.add_child(enemy) 
