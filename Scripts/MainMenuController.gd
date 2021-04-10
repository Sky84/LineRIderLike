extends Control

onready var LevelsMenu = get_node("../LevelsMenu");
onready var MainMenu = get_node("../MainMenu");

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelsMenu.hide();
	MainMenu.show();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayCampaignButton_button_up():
	MainMenu.hide();
	LevelsMenu.show();
	


func _on_PlayInfiniteButton_button_up():
	SceneManager.load_scene(SceneManager.Scene.InfiniteGame);