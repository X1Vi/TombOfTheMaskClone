extends StaticBody2D

export var next_scene = "level_scene_here"

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	GlobalScene.levels[GlobalScene.current_level_tracking].levelUnlocked = true
	if GlobalScene.current_level_tracking - 1 == GlobalScene.last_level:
		pass
	else:
		if  GlobalScene.current_level_tracking  == GlobalScene.last_level - 1 and body.name == "Player":
			GlobalScene.save_to_file()
		else:
			GlobalScene.save_to_file()
			GlobalScene.current_level_tracking = GlobalScene.current_level_tracking + 1
			var t_next_scene = GlobalScene.levels[GlobalScene.current_level_tracking].levelScene
			GlobalScene.lives = 3
			get_tree().change_scene(t_next_scene)
		
		
