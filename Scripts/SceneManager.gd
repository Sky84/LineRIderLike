extends Node

onready var RootScene = get_node("/root/RootScene");
const Scene = {
	InfiniteGame = "res://Scenes/InfiniteGame.tscn",
	MainMenu = "res://Scenes/MainMenu.tscn",
}

const levels = [
	{"index":1, "label":"Give", "path":"res://Scenes/Levels/Level_1.tscn", "path_preview":"res://Sprites/Previews/lvl1.png"},
	{"index":2, "label":"A", "path":"res://Scenes/Levels/Level_2.tscn", "path_preview":"res://Sprites/Previews/lvl2.png"},
	{"index":3, "label":"Second", "path":"res://Scenes/Levels/Level_3.tscn", "path_preview":"res://Sprites/Previews/lvl3.png"},
	{"index":4, "label":"Chance", "path":"res://Scenes/Levels/Level_4.tscn", "path_preview":"res://Sprites/Previews/lvl4.png"},
];

var currentScene;

var current_level;

signal on_scene_changed(path);

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scene(Scene.MainMenu);

func load_scene(path:String):
	if currentScene:
		RootScene.remove_child(currentScene);
	var nextScene: Node = load(path).instance();
	RootScene.add_child(nextScene);
	currentScene = nextScene;
	emit_signal("on_scene_changed", path);

func load_level(level):
	current_level = level;
	load_scene(level.path);

func get_level_by_index(index:int):
	for level in levels:
		if level.index == index:
			return level;
	return null;

func add_child_to_current_scene(child:Node):
	currentScene.add_child(child);
