extends Area2D

var laser : Area2D
var laserCollider : CollisionShape2D
var sound : AudioStreamPlayer
var last_stage_time : int
enum {LASER_OFF, LASER_STARTING, LASER_ON}
var current_stage = LASER_OFF

# Called when the node enters the scene tree for the first time.
func _ready():
	laser = get_node("laser")
	laserCollider = laser.get_node("collider")
	sound = get_node("sound")
	laser.hide()
	laserCollider.disabled = true
	last_stage_time = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_stage in [LASER_ON, LASER_STARTING]:
		rotate(2*PI/360)
		
	var current_time = Time.get_ticks_msec()
	
	if current_stage == LASER_OFF and current_time - last_stage_time >= 5000:
		current_stage = LASER_STARTING
		last_stage_time = current_time
	elif current_stage == LASER_STARTING and current_time - last_stage_time >= 3000:
		current_stage = LASER_ON
		laser.show()
		laserCollider.disabled = false
		sound.play()
		last_stage_time = current_time
	elif current_stage == LASER_ON and current_time - last_stage_time >= 5000:
		current_stage = LASER_OFF
		laser.hide()
		laserCollider.disabled = true
		sound.stop()
		last_stage_time = current_time
		


func _on_laser_body_entered(body):
	if body.name == "player":
		body.take_damage()
