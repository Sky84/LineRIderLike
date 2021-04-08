extends Node2D

var mouse_left_down: bool = false;
var radiusPoint = 4;

var draws = {};
var collisionsShapes = [];
onready var currentStaticBody: StaticBody2D = $TerrainStaticBody2D;

func _input(event:InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true;
		elif event.button_index == 1 and !event.is_pressed():
			mouse_left_down = false;
	elif Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene();

func _update_collision(point1:Vector2, point2:Vector2):
	# Créer une shape2D
	var segment = SegmentShape2D.new()
	segment.a = point1 # Début du segment
	segment.b = point2 # fin du segment

	# Créer le collision shape
	var collision_shape = CollisionShape2D.new()
	collision_shape.shape = segment
	currentStaticBody.add_child(collision_shape);

func _process(delta):
	if mouse_left_down:
		var current_point = {
			"position": get_global_mouse_position(), 
			"radius": radiusPoint,
			"id": draws.size()
		};
		draws[current_point.id] = current_point;
		if current_point.id - 1 in draws:
			var previous_point = draws[current_point.id - 1];
			_update_collision(previous_point.position, current_point.position);
		update();

func _draw():
	for key in draws:
		var draw = draws[key];
		draw_circle(draw.position, draw.radius, Color.black);
