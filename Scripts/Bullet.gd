extends KinematicBody2D

var layer_to_detect : int = 1
onready var timer : Timer = $Timer
var direction_vector : Vector2 = Vector2.DOWN
var speed : int 

func _physics_process(delta):
	var collisons = move_and_collide(direction_vector * speed * delta)
	detectCollisionWithTilemap(collisons)	
func _ready():
	timer.start()


func _on_Area2D_body_entered(body):
	onCollisionWithPlayer(body)
	
func onCollisionWithPlayer(body):
	if body.name == "Player":
		print("player collided with bomb")
		GlobalScene.lives = GlobalScene.lives - 1
		self.queue_free()
	

func _on_Timer_timeout():
	self.queue_free()



func _on_Area2D_area_entered(area):
	pass
		
func detectCollisionWithTilemap(collision):
	if collision:
		if collision.collider is TileMap:
			self.queue_free()
