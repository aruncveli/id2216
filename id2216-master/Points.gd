extends Label


func _process(delta):
	self.text = "Points:" + str(Game.points) + "/25"
