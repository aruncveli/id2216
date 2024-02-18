extends PathFollow2D

var enemy: PathFollow2D;
var speed = 1.0;

func _ready():
	enemy = get_node(get_path())

func _process(delta):
	enemy.progress_ratio += delta * speed * 0.25
	if enemy.progress_ratio >= 1:
		Global.lives -=1
		queue_free()
