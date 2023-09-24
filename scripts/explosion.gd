extends CPUParticles2D


var timer : Timer
var boom : AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node("Timer")
	boom = get_node("boom")
	timer.start(lifetime)
	boom.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func _on_timer_timeout():
	queue_free()
