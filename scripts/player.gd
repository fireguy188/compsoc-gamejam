extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var collision = move_and_collide(get_global_mouse_position() - global_position)
	
	if collision:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
