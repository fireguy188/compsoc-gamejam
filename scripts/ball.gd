extends RigidBody2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1)).normalized() * 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		body.take_damage()
