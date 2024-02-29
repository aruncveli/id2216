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
		if event is InputEventScreenTouch and event.pressed:
			add_child(tempTower)
			tempTower.position = event.position
		
		elif event is InputEventScreenDrag and event.pressure >= 0.0:
			if get_child_count() > 1:
				get_child(1).position = event.position

		elif event is InputEventScreenTouch and not event.pressed:
			# Local position is the position relative to the Lvl1 node
			var local_position = level.to_local(event.position)
			# 0-indexed (I think) coordinates of cell the mouse pointer is in, with respect to the tile map
			var tile_map_cell_coordinates = tile_map.local_to_map(local_position)
			print(tile_map_cell_coordinates)
			 # true if tree can be placed
			if not tree_placeable_cells.has(tile_map_cell_coordinates):
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				if get_child_count() > 1:
					get_child(1).queue_free()
				var path = get_tree().get_root().get_node("Lvl1/Towers")
				path.add_child(tempTower)
				tempTower.position = event.position
				tempTower.get_node("Area").hide()
				Game.Sun -= 50
		else:
			if get_child_count() > 2:
				get_child(1).queue_free()
