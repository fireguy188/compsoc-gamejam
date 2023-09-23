extends Area2D

var viewport : Viewport
var explosion : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport()
	explosion = preload("res://effects/explosion.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	look_at(viewport.get_mouse_position())
	rotate(PI/2)
	position += (viewport.get_mouse_position() - position).normalized() * 5


func _on_body_entered(body):
	print(body)
	if body.name == "player":
		body.take_damage()
	elif body.is_in_group("enemy"):
		var node = explosion.instantiate()
		get_parent().add_child(node)
		node.position = body.position
		node.emitting = true
		
		body.queue_free()
		queue_free()




func _on_area_entered(area):
	if area.is_in_group("enemy"):
		var node = explosion.instantiate()
		get_parent().add_child(node)
		node.position = area.position
		node.emitting = true
		
		area.queue_free()
		queue_free()
