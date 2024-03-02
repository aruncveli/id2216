extends CharacterBody2D

@export var speed = 50
var Health = 10

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		Game.Health -= 1
		get_parent().get_parent().queue_free()
		Game.live_enemies_count -= 1
		
	if Health <= 0:
		get_parent().get_parent().queue_free()
		Game.live_enemies_count -= 1
		Game.Sun += 25
	
	$AnimatedSprite2D.animation = "Walk"
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play()
