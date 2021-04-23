extends Control

onready var LevelsButtonContainer = $GridContainer;
var level_button: Resource = load("res://Objects/ButtonLevel.tscn");
var buttons = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	for level in SceneManager.levels:
		var button: Button = level_button.instance();
		button.get_node("Label").text = level.label;
		button.connect("button_up", self, "_onLevelSelected", [button, level]);
		button.get_node("PreviewTexture").texture = load(level.path_preview);
		LevelsButtonContainer.add_child(button);
		buttons.append(button);

func _onLevelSelected(button, level):
	if button.selected:
		SceneManager.load_level(level);
	for btn in buttons:
		if btn == button:
			btn.emit_signal("on_selected_change", true);
		else:
			btn.emit_signal("on_selected_change", false);
