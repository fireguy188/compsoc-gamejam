extends Area2D

var viewport: Viewport

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport()
	DisplayServer.mouse_set_mode(DisplayServer.MOUSE_MODE_HIDDEN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = viewport.get_mouse_position()
