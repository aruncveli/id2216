extends Node2D

@onready var path1 = preload("res://Stage3.tscn")
@onready var path2 = preload("res://Stage4.tscn")
@onready var timer: Timer = $"Timer"
var wave_strength = 5
var wave_progress = 0



func _on_timer_timeout():
	var tempPath = path1.instantiate()
	add_child(tempPath)
	tempPath  = path2.instantiate()
	add_child(tempPath)
	Game.live_enemies_count += 2
	wave_progress += 1
	if wave_progress == wave_strength:
		timer.stop()
		wave_progress = 0
		wave_strength *= 2
		
func _process(delta: float) -> void:
	if timer.is_stopped() and Game.live_enemies_count == 0:
		timer.start(1)
