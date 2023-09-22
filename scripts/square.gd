extends Area2D

var viewport : Viewport

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(viewport.get_mouse_position())
	rotate(PI/2)
	position += (viewport.get_mouse_position() - position).normalized() * 5


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage()
