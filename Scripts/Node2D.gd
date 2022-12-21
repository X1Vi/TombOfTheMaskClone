extends KinematicBody2D

export var velocity_vector = Vector2.ZERO 

func _physics_process(delta):
	move_and_slide(velocity_vector)
	if get_slide_count() > 0:
		velocity_vector = velocity_vector * -1
	
	
	 


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		GlobalScene.lives = GlobalScene.lives - 1
		print(body.name + "is dead")
