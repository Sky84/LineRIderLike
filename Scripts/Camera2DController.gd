extends Camera2D

var target:Node2D;

func _ready():
	target = get_tree().get_nodes_in_group("Ball")[0];

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target:
		global_position = lerp(global_position, target.global_position, 0.3)
