extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var is_paused = false;

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if !is_paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
			visible = true
			is_paused = true
		else:
			get_viewport().warp_mouse(get_node('/root/game/player').position)
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)
			get_tree().paused = false
			visible = false
			is_paused = false
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_continue_btn_pressed():
	get_viewport().warp_mouse(get_node('/root/game/player').position)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED_HIDDEN)
	get_tree().paused = false
	visible = false
	is_paused = false


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	get_tree().paused = false
