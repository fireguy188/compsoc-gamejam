extends Node

var music = AudioStreamPlayer.new()
var stream = preload("res://audio/help.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	music.stream = stream
	music.volume_db = -12.381
	
func play():
	add_child(music)
	music.play()

func stop():
	music.stop()
	remove_child(music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
