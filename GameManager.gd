extends Node

var coins = 40
var lives = 50

var coins_label: Label
var lives_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	coins_label = $CanvasLayer/UI/Stats/Coins/Label
	lives_label = $CanvasLayer/UI/Stats/Lives/Label
	_update_stats()

func _update_stats():
	coins_label.text = str(coins)
	lives_label.text = str(lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
