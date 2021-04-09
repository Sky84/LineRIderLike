extends Node

const Scene = {
	InfiniteGame = "res://Scenes/InfiniteGame.tscn",
	MainMenu = "res://Scenes/MainMenu.tscn",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func load_scene(path:String):
	get_tree().change_scene(path);
