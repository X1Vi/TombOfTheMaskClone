extends KinematicBody2D

onready var global_scene = get_node("/root/GlobalScene")

export var velocity_vector = Vector2.ZERO 

signal play_hit_animation(play_hit_anim)


func _ready():
	print("player_scene_node " + str(global_scene))
	self.connect("play_hit_animation", global_scene, "get_player_hit_anim_bool")

func _physics_process(delta):
	move_and_slide(velocity_vector)
	if get_slide_count() > 0:
		velocity_vector = velocity_vector * -1
	
	
	 


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		emit_signal("play_hit_animation", true)
		GlobalScene.lives = GlobalScene.lives - 1
		print(body.name + "is dead")


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		emit_signal("play_hit_animation", false)
		print("bat enemy body exited")
