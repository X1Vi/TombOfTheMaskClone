extends Node2D

onready var gridContainer : GridContainer = get_node("ScrollContainer/GridContainer")
var  start : int  = 0
var buttonScene = load("res://Scenes/Button.tscn")
var numberOfLevels = GlobalScene.levels.size()
func _physics_process(delta):
	pass

func _ready():
	for level in numberOfLevels:
		var t_button = buttonScene.instance()
		gridContainer.add_child(t_button)
	assignLevelValues()

func assignLevelValues():
	
	var buttons = gridContainer.get_children()
	for button in buttons:
		button.loadThisLevel = start
		button.text = "Level" + str(start)
		start = start + 1
		
func printButtonValues():
	pass	
	
