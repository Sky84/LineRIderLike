extends Node

onready var win_panel:Control = get_node("./WinScreen");

func show_win_screen():
	win_panel.show();
