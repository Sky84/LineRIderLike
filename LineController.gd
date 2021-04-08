extends Node2D

var mouse_left_down: bool = false;
var radiusPoint = 4;

var draws = [];
var collisionsShapes = [];
var currentCollisionsShapes = {};

func _input(event:InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true;
		elif event.button_index == 1 and !event.is_pressed():
			mouse_left_down = false;

func _process(delta):
	if mouse_left_down:
		draws.append({
			"position": get_global_mouse_position(), 
			"radius":radiusPoint
		});
		update();

func _draw():
	for draw in draws:
		draw_circle(draw.position, draw.radius, Color.black);
