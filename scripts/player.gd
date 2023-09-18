extends CharacterBody2D

var viewport: Viewport

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)
	viewport = get_viewport()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	#get_global_mouse_position() - global_position
	var collision = move_and_collide(viewport.get_mouse_position() - position)

	if collision:
		# YOU DIED
		pass
		#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
		#DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
