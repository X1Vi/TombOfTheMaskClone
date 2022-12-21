extends StaticBody2D

export var next_scene = "level_scene_here"




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("Player entered portal")
		var level_name = GlobalScene.level_selection[round(rand_range(0, 3))]
		get_tree().change_scene(level_name)
		
