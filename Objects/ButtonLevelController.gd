extends Button

onready var animationPlayer = $AnimationPlayer;

var selected = false;
signal on_selected_change(value);
func _ready():
	connect("on_selected_change", self, "on_select");

func on_select(value:bool):
	if value and !selected:
		animationPlayer.play("on_mouse_enter");
	elif !value and selected:
		animationPlayer.play_backwards("on_mouse_enter");
	selected = value;
