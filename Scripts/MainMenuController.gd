extends Control

onready var tween = get_node("../Tween");
onready var LevelsMenu = get_node("../LevelsMenu");
onready var LevelsMenuBackground = get_node("../level_select");
onready var MainMenu = get_node("../MainMenu");
onready var MainMenuBackground = get_node("../main_menu");

# Called when the node enters the scene tree for the first time.
func _ready(): 
	LevelsMenu.hide();
	LevelsMenuBackground.hide();
	MainMenu.show();

func _set_visibility_menu(objectMenus:Array, visible:bool):
	var alphaStart = 0 if visible else 1;
	var alphaTarget = 1 if visible else 0;
	for objectMenu in objectMenus:
		if visible:
			objectMenu.show();
		var objectColorStart = objectMenu.modulate;
		var objectColorTarget = objectMenu.modulate;
		objectColorTarget.a = alphaTarget;
		objectColorStart.a = alphaStart;
		tween.interpolate_property(objectMenu, 'modulate', objectColorStart, objectColorTarget, 1, Tween.EASE_IN);
		tween.start();

func _on_PlayCampaignButton_button_up():
	_set_visibility_menu([MainMenu, MainMenuBackground], false);
	_set_visibility_menu([LevelsMenu, LevelsMenuBackground], true);

func _on_PlayInfiniteButton_button_up():
	SceneManager.load_scene(SceneManager.Scene.InfiniteGame);

func _on_Tween_tween_completed(object, key):
	if object.modulate.a == 0:
		object.hide();
	else:
		object.show();
