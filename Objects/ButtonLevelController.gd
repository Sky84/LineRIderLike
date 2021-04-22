extends Button

onready var animationPlayer = $AnimationPlayer;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ButtonLevel_pressed():
	animationPlayer.play("on_mouse_enter");
	print("test")
