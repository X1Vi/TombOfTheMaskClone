extends KinematicBody2D


signal transfer_dir(dir)
var arr = []
var direction = Vector2.ZERO
onready var timer = $Timer
var MAX_SPEED = 1000
onready var animation_player = $AnimationPlayer
onready var lives_indicator = $Camera2D/RichTextLabel

var start_point
var end_position
onready var sprite = $Sprite

func _is_player():
	pass

func _ready():
	pass 

func _physics_process(delta):
	
	
	_restart_level()
	lives_indicator.text = str(GlobalScene.lives)
	move_and_slide(MAX_SPEED * direction)
	
	
	
func _input(event):
	if event is InputEventScreenTouch:
		animation_player.play("Walk")
		print("touched screen")
		arr.append(event.position)
		if arr.size() >= 2:
			print("size is greater than 2")
			timer.start()


func _on_Timer_timeout():
	
	if arr.size() < 2:
		pass
	else:
		start_point = arr[0]
		end_position = arr[arr.size() - 1]
		print(start_point)
		print(end_position)
		direction = end_position - start_point
		direction = direction.normalized()
		
		if direction.x < 0 and abs(direction.x) > abs(direction.y):
			direction.x = -1
			direction.y = 0
		elif direction.x > 0 and abs(direction.x) > abs(direction.y):
			direction.x = 1
			direction.y = 0
		elif direction.y > 0 and abs(direction.x) < abs(direction.y):
			direction.y = 1
			direction.x = 0
		else:
			direction.y -1
			direction.x = 0
		
			
		
		print(direction)
		
	arr = []



func _restart_level():
	if GlobalScene.lives == 0:
		GlobalScene.lives = 3
		get_tree().reload_current_scene()
		
		
		
