extends Node2D

onready var gridContainer : GridContainer = $ScrollContainer/GridContainer
var  start : int  = 0

func _physics_process(delta):
	pass

func _ready():
	assignLevelValues()

func assignLevelValues():
	
	var buttons = gridContainer.get_children()
	for button in buttons:
		button.loadThisLevel = start
		button.text = "Level" + str(start)
		start = start + 1
		
func printButtonValues():
	pass	
	
