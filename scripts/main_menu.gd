extends Control


var music : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	music = get_node("music")
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_normal_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "normal"

func _on_help_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/help_menu.tscn")
	HelpMusic.play()





func _on_double_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "double"


func _on_hell_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "hell"


func _on_laser_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "laser"
