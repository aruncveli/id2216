extends Panel

@onready var tower = preload("res://Tree1.tscn")
var currFile


func _on_gui_input(event):
	if Game.Sun >=50:
		var tempTower = tower.instantiate()
		if event is InputEventMouseButton and event.button_mask == 1:
			add_child(tempTower)
			tempTower.global_position = event.global_position
		
		
		elif event is InputEventMouseMotion and event.button_mask == 1:
			if get_child_count() > 1:
				get_child(1).global_position = event.global_position
				var mapPath = get_tree().get_root().get_node("Lvl1/NormalSimpleTree/SpriteCover")
				var tile = mapPath.get_global_mouse_position()
				
		
		
		elif event is InputEventMouseButton and event.button_mask == 0:
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
		
