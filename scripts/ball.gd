extends RigidBody2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(rng.randf_range(-1, 1)*1000, rng.randf_range(-1, 1)*1000))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
