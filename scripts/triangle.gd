extends Area2D

var rng = RandomNumberGenerator.new()
var sound : AudioStreamPlayer
var viewport : Rect2

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport_rect()
	sound = get_node("sound")
	sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y -= 5
	
	if position.y <= -50:
		position.y = viewport.size.y
		#position.x = rng.randf_range(50, viewport.size.x-50)
		sound.play()


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage()
