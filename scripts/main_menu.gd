extends Control


var music : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	music = get_node("music")
	music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_help_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/help_menu.tscn")
