extends Panel

@onready var tower = preload("res://Tree2.tscn")
var currFile
@onready var level = get_tree().get_root().get_node("Lvl2")
@onready var tile_map = get_tree().get_root().get_node("Lvl2/TileMap")
@onready var tree_placeable_cells = tile_map.get_used_cells(0)
var drag_offset = Vector2(0,333) # workaround

func _on_gui_input(event: InputEvent):
	if Game.Sun >= 50:
		var tempTower = tower.instantiate()
		if event is InputEventScreenTouch and event.pressed:
			add_child(tempTower)
			tempTower.global_position = event.position + drag_offset
		elif event is InputEventScreenDrag:
			if get_child_count() > 1:
				var tree = get_child(1)
				tree.global_position = event.position + drag_offset
				var tree_area = tree.get_node("Area")
				
				var translated_position = event.position + drag_offset
				var tile_map_cell_coordinates = tile_map.local_to_map(translated_position)
				var tile = tile_map.get_cell_alternative_tile(0, tile_map_cell_coordinates)
				
				if not tree_placeable_cells.has(tile_map_cell_coordinates):
					var new_stylebox_normal = tree_area.get_theme_stylebox("panel").duplicate()
					new_stylebox_normal.bg_color = Color(0.55, 0, 0, 0.3)
					tree_area.add_theme_stylebox_override("panel", new_stylebox_normal)
				else:
					var new_stylebox_normal = tree_area.get_theme_stylebox("panel").duplicate()
					new_stylebox_normal.bg_color = Color(0, 0.4, 0, 0.3)
					tree_area.add_theme_stylebox_override("panel", new_stylebox_normal)

		elif event is InputEventScreenTouch and not event.pressed:
			# 0-indexed (I think) coordinates of cell the mouse pointer is in, with respect to the tile map
			var translated_position = event.position + drag_offset
			var tile_map_cell_coordinates = tile_map.local_to_map(translated_position)
			var tile = tile_map.get_cell_alternative_tile(0, tile_map_cell_coordinates)
			
			# true if tree can be placed
			if not tree_placeable_cells.has(tile_map_cell_coordinates):
				if get_child_count() > 1:
					get_child(1).queue_free()
			else:
				if get_child_count() > 1:
					get_child(1).queue_free()
				var path = get_tree().get_root().get_node("Lvl2/Towers")
				path.add_child(tempTower)
				tempTower.global_position = tile_map.map_to_local(tile_map_cell_coordinates) + Vector2(-13, -13)
				tempTower.get_node("Area").hide()
				tempTower.placed = true
				Game.Sun -= 50
				tree_placeable_cells.erase(tile_map_cell_coordinates)
		else:
			if get_child_count() > 2:
				get_child(1).queue_free()
