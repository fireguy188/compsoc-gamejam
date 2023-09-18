extends Sprite2D

var laser : Sprite2D
var last_stage_time : int
enum {LASER_OFF, LASER_STARTING, LASER_ON}
var current_stage = LASER_OFF

# Called when the node enters the scene tree for the first time.
func _ready():
	laser = get_node("laser")
	laser.hide()
	last_stage_time = Time.get_ticks_msec()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_stage in [LASER_ON, LASER_STARTING]:
		rotate(2*PI/360)
		
	var current_time = Time.get_ticks_msec()
	
	if current_stage == LASER_OFF and current_time - last_stage_time >= 5000:
		current_stage = LASER_STARTING
		last_stage_time = current_time
		print("yaya")
	elif current_stage == LASER_STARTING and current_time - last_stage_time >= 3000:
		current_stage = LASER_ON
		laser.show()
		last_stage_time = current_time
	elif current_stage == LASER_ON and current_time - last_stage_time >= 5000:
		current_stage = LASER_OFF
		laser.hide()
		last_stage_time = current_time
		
