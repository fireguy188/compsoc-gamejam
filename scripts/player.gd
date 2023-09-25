extends CharacterBody2D

var viewport: Viewport
var viewportRect: Rect2

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport()
	viewportRect = get_viewport_rect()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_process(_delta):
	var mousePos = viewport.get_mouse_position()
	var newPos = mousePos
	
	var width = 20
	newPos.x = clamp(newPos.x, width, viewportRect.size.x-width)
	newPos.y = clamp(newPos.y, width, viewportRect.size.y-width)
	position = newPos

func take_damage():
	# YOU DIED
	if Globals.username != "":
		PlayerRequester.send_score(get_parent().roundNum)

	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_VISIBLE)
	
	
