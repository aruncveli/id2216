extends Panel

@onready var tower = preload("res://Tree1.tscn")
var currFile
var level: Node2D
var tile_map: TileMap
var tree_placeable_cells: Array[Vector2i]

func _ready():
	level = get_tree().get_root().get_node("Lvl1")
	tile_map = get_tree().get_root().get_node("Lvl1/TileMap")
	tree_placeable_cells = tile_map.get_used_cells(0)

func _on_gui_input(event: InputEvent):
	if Game.Sun >=50:
		var tempTower = tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
			add_child(tempTower)
			tempTower.global_position = event.global_position
		
		elif event is InputEventMouseMotion and event.button_mask == 1:
			if get_child_count() > 1:
				get_child(1).global_position = event.global_position

		elif event is InputEventMouseButton and event.button_mask == 0:
			var local_position = level.to_local(event.global_position)
			var map_position = tile_map.local_to_map(local_position)
			print(map_position)
			print(tree_placeable_cells.has(map_position)) # true if tree can be placed
			
			if event.global_position.x >= 787:
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				if get_child_count() > 1:
					get_child(1).queue_free()
				var path = get_tree().get_root().get_node("Lvl1/Towers")
				path.add_child(tempTower)
				tempTower.global_position = event.global_position
				tempTower.get_node("Area").hide()
				Game.Sun -= 50
		else:
			if get_child_count() > 2:
				get_child(1).queue_free()
