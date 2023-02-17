extends StaticBody2D

onready var gunAnimationPlayer : AnimationPlayer = $AnimationPlayer
export var speed : int
export var rateOfFire : int = 2
onready var bulletSpawnPoint : Position2D = $spawnPoint
onready var timer : Timer = $Timer
# Load the scene for the object you want to spawn
var bullet_scene = load("res://Scenes/Bullet.tscn")

# Create a new instance of the object


func _physics_process(delta):
	gunAnimationPlayer.play("gun_fire")
func _ready():
	timer.wait_time = rateOfFire
	timer.start()


func _on_Timer_timeout():
	
	var bullet_instance = bullet_scene.instance()
	bullet_instance.speed = speed
	bullet_instance.position = bulletSpawnPoint.position
	add_child(bullet_instance)

func collisionWithEnvironment():
	pass

