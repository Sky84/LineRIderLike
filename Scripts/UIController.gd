extends Node

onready var win_panel:Control = get_node("./WinScreen");
onready var loose_panel:Control = get_node("./LooseScreen");
onready var game_finished_panel:Control = get_node("./GameFinishedScreen");

func show_win_screen():
	win_panel.show();

func show_loose_screen():
	loose_panel.show();
	
func show_game_finished_screen():
	game_finished_panel.show();

func _on_NextLevelButton_button_up():
	GameManager.next_level();

func _on_BackToMenuButton_button_up():
	GameManager.back_to_menu();

func _on_RetryLevelButton_button_up():
	GameManager.retry_level();

func _on_InfiniteModButton_button_up():
	GameManager.load_infinite_mod();
