extends Panel

@onready var tower = preload("res://Tree1.tscn")
var currFile
var level: Node2D
var tile_map: TileMap
var tree_placeable_cells: Array[Vector2i]
var placement_offset = Vector2(787,0) # workaroundremove i

func _ready():
	level = get_tree().get_root().get_node("Lvl1")
	tile_map = get_tree().get_root().get_node("Lvl1/TileMap")
	tree_placeable_cells = tile_map.get_used_cells(0)

func _on_gui_input(event: InputEvent):
	if Game.Sun >= 50:
		var tempTower = tower.instantiate()
		if event is InputEventScreenTouch and event.pressed:
			add_child(tempTower)
			tempTower.global_position = event.position
		
		elif event is InputEventScreenDrag and event.pressure >= 0.0:
			if get_child_count() > 1:
				get_child(1).global_position = event.position + placement_offset

		elif event is InputEventScreenTouch and not event.pressed:
			# 0-indexed (I think) coordinates of cell the mouse pointer is in, with respect to the tile map
			var translated_position = event.position + placement_offset
			var tile_map_cell_coordinates = tile_map.local_to_map(translated_position)
			var tile = tile_map.get_cell_alternative_tile(0, tile_map_cell_coordinates)
			
			# true if tree can be placed
			if not tree_placeable_cells.has(tile_map_cell_coordinates):
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				if get_child_count() > 1:
					get_child(1).queue_free()
				var path = get_tree().get_root().get_node("Lvl1/Towers")
				path.add_child(tempTower)
				tempTower.global_position = tile_map.map_to_local(tile_map_cell_coordinates) + Vector2(0, -10)
				tempTower.get_node("Area").hide()
				tempTower.placed = true
				Game.Sun -= 50
				tree_placeable_cells.erase(tile_map_cell_coordinates)
		else:
			if get_child_count() > 2:
				get_child(1).queue_free()
