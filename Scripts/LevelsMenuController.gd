extends Control

onready var LevelsButtonContainer = $CenterContainer/GridContainer;
var level_button: Resource = load("res://Objects/Button.tscn");

var levels = [
	{"label":"Give", "path":"res://Scenes/Levels/Level_1.tscn"},
	{"label":"A", "path":"res://Scenes/Levels/Level_2.tscn"},
	{"label":"Second", "path":"res://Scenes/Levels/Level_3.tscn"},
	{"label":"Chance", "path":"res://Scenes/Levels/Level_4.tscn"},
];


# Called when the node enters the scene tree for the first time.
func _ready():
	for level in levels:
		var button: Button = level_button.instance();
		button.text = level.label;
		button.connect("button_up", self, "_onLevelSelected", [level]);
		LevelsButtonContainer.add_child(button);

func _onLevelSelected(level):
	SceneManager.load_scene(level.path);
