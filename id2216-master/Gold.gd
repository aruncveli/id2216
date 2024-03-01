extends Label


func _process(delta):
	self.text = "Sun:" + str(Game.Sun)
