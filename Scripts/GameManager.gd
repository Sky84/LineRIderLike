extends Node

var UIController;

# Called when the node enters the scene tree for the first time.
func _ready():
	SceneManager.connect("on_scene_changed", self, "_on_scene_changed");

func _on_scene_changed(path:String):
	var UINode:Node = get_node_or_null("/root/RootScene/"+SceneManager.currentScene.name+"/UI");
	if path.find("Level") > -1 and !UINode:
		_init_game_scene();

func _init_game_scene():
	UIController = load("res://Objects/UI.tscn").instance();
	SceneManager.add_child_to_current_scene(UIController);

func win_game():
	if SceneManager.levels.size() == SceneManager.current_level.index:
		back_to_menu();
	else:
		next_level();

func loose_game():
	retry_level();

func next_level():
	var level = SceneManager.get_level_by_index(SceneManager.current_level.index+1);
	if level:
		SceneManager.load_level(level);

func retry_level():
	SceneManager.load_level(SceneManager.current_level);

func back_to_menu():
	SceneManager.load_scene(SceneManager.Scene.MainMenu);
	
func load_infinite_mod():
	SceneManager.load_scene(SceneManager.Scene.InfiniteGame);
