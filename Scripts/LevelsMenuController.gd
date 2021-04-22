extends Control

onready var LevelsButtonContainer = $GridContainer;
var level_button: Resource = load("res://Objects/ButtonLevel.tscn");


# Called when the node enters the scene tree for the first time.
func _ready():
	for level in SceneManager.levels:
		var button: Button = level_button.instance();
		button.get_node("Label").text = level.label;
		button.connect("button_up", self, "_onLevelSelected", [level]);
		LevelsButtonContainer.add_child(button);

func _onLevelSelected(level):
	SceneManager.load_level(level);
