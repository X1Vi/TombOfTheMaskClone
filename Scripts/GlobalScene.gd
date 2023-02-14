extends Node2D

var lives = 3

var current_level_tracking : int

var levels = [
	{"levelScene":"res://Levels/Area1/Level2.tscn", "levelUnlocked" : true},
	{"levelScene" : "res://Levels/Area1/Level3.tscn", "levelUnlocked" : false},
	{"levelScene" :"res://Levels/Area1/Level4.tscn", "levelUnlocked" : false}
	
]

var last_level : int = levels.size()

onready var level_selection = [
	"res://Levels/Area1/Level2.tscn",
	"res://Levels/Area1/Level4.tscn",
	"res://Levels/Area1/Level3.tscn"
]

func _ready():
	pass


func _physics_process(delta):
	for level in levels:
		print(level.levelUnlocked)
