extends StaticBody2D

onready var area2D:Area2D = $Area2D;

func _ready():
	area2D.connect("body_entered", self, "_on_Area2D_body_entered");

func _on_Area2D_body_entered(body):
	if body is RigidBody2D and body.name == "Ball":
		GameManager.loose_game();
