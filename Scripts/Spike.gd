extends StaticBody2D

onready var animatedsprite = $AnimatedSprite
onready var timer = $Timer
onready var area2d = $Area2D

func _ready():
	animatedsprite.play("default")

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	
	if body is KinematicBody2D:
		print("Trap Activated")
		animatedsprite.play("default")
		modulate = Color(0.807843, 0.215686, 0.215686)
		timer.start()
	


func _on_Timer_timeout():
	animatedsprite.play("Unleashed")
	GlobalScene.lives = GlobalScene.lives - 1
	print("death by spike")


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		modulate = Color(1, 1, 1)
		timer.stop()
	animatedsprite.play("default")
