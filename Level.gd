extends Node2D
 
@export var enemyAsset: PackedScene
var TREE_TILE = preload("res://TreeTile.tscn")
var rng = RandomNumberGenerator.new();

func _ready():
	# Add first tree tile
	var tree_tile : Area2D = TREE_TILE.instantiate()
	tree_tile.position = Vector2i(90, 90)
	add_child(tree_tile)

func _on_enemy_spawn():
	var enemy = enemyAsset.instantiate()
	if rng.randi_range(0, 1):
		$Path2D1.add_child(enemy)
	else:
		$Path2D2.add_child(enemy)
