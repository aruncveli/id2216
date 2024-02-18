extends Node

var coins_label: Label
var lives_label: Label

func _ready():
	coins_label = $CanvasLayer/UI/Stats/Coins/Label
	lives_label = $CanvasLayer/UI/Stats/Lives/Label

func _process(delta):
	coins_label.text = str(Global.coins)
	lives_label.text = str(Global.lives)
