extends Button


var loadThisLevel:int 




func _ready():
	pass




func _on_Button_pressed():
	if GlobalScene.levels[loadThisLevel].levelUnlocked == true:
		var t_scene = GlobalScene.levels[loadThisLevel].levelScene
		get_tree().change_scene(t_scene)
		GlobalScene.current_level_tracking = loadThisLevel
	elif GlobalScene.levels[loadThisLevel].levelUnlocked == false:
		pass
	
		
