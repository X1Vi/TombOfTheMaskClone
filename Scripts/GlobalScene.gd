extends Node2D

var path = "res://Saves/levels_save.json"

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
	load_from_file()

func _physics_process(delta):
	pass

func save_to_file():
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_string(to_json(levels))
	file.close()

func load_from_file():
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var json_string = file.get_as_text()
		levels = parse_json(json_string)
		file.close()
		
func clear_file():
	var file = File.new()
	if file.file_exists(path):
		file.remove(path)
		print("File deleted.")
	else:
		print("File does not exist.")
