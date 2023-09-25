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
	Globals.music = "res://audio/game_music.mp3"

func _on_help_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/help_menu.tscn")
	HelpMusic.play()





func _on_double_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "double"
	Globals.music = "res://audio/double_trouble.mp3"


func _on_hell_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "hell"
	Globals.music = "res://audio/hell.mp3"


func _on_laser_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	Globals.mode = "laser"
	Globals.music = "res://audio/laser_mania.mp3"


func _on_leaderboard_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")


func _on_username_text_changed(new_text):
	Globals.username = new_text.strip_edges(true, true)
