extends Node

onready var RootScene = get_node("/root/RootScene");
const Scene = {
	InfiniteGame = "res://Scenes/InfiniteGame.tscn",
	MainMenu = "res://Scenes/MainMenu.tscn",
}

var currentScene;
var UIController;

# Called when the node enters the scene tree for the first time.
func _ready():
	load_scene(Scene.MainMenu);

func load_scene(path:String):
	if currentScene:
		RootScene.remove_child(currentScene);
	var nextScene: Node = load(path).instance();
	RootScene.add_child(nextScene);
	currentScene = nextScene;
	if currentScene.name.find("Level") > -1 and !UIController:
		print(currentScene.name)
		UIController = load("res://Objects/UI.tscn").instance();
		currentScene.add_child(UIController);
