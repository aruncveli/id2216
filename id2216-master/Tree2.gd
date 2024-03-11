extends StaticBody2D

var Bullet = preload("res://pineBullet.tscn")
var bulletDamage = 3.5
var pathName
var currTargets = []
var curr
var placed: bool = false

func _process(delta):
	if not is_instance_valid(curr):
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()
	
	$AnimatedSprite2D.animation = "idle"
	#$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play()


func _on_tower_body_entered(body):
	if "Soldier" in body.name and placed:
		var tempArray =[]
		currTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "Soldier" in i.name:
				tempArray.append(i)
		var currTarget = null
		
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
		
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = Bullet.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDamage = bulletDamage
		get_node("BulletContainer").call_deferred("add_child", tempBullet)
		tempBullet.global_position = $Aim.global_position




func _on_tower_body_exited(body):
	currTargets = get_node("Tower").get_overlapping_bodies()
