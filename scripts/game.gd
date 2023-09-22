extends Node2D

var infoTxt: RichTextLabel
var roundNum = 0
var lasers = []
var rng = RandomNumberGenerator.new()
var viewportRect: Rect2
var player: CharacterBody2D
var timer = Timer.new()

var laser = preload("res://characters/laser cannon.tscn")
var ball = preload("res://characters/ball.tscn")
var triangle = preload("res://characters/triangle.tscn")
var square = preload("res://characters/square.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	infoTxt = get_node("infoTxt")
	viewportRect = get_viewport_rect()
	player = get_node("player")
	
	add_child(timer)
	timer.one_shot = true
	timer.start(2)
	timer.connect("timeout", startGame)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func startGame():
	var intros = [["[center]This is a laser. Best not to get in the way of its beam.[/center]", "laser"],
				  ["[center]This is a ball. Do NOT block its bounce path.[/center]", "ball"],
				  ["[center]This is a triangle. Please mind its sharpness.[/center]", "triangle"],
				  ["[center]Finally this is a square. Just don't stop moving![/center]", "square"]]
	
	infoTxt.text = intros[roundNum][0]
	addEnemy(intros[roundNum][1])
	
	if roundNum < 3:
		roundNum += 1
		timer.start(5)
	else:
		timer.disconnect("timeout", startGame)
		timer.connect("timeout", updateRound)
		timer.start(5)
		timer.one_shot = false

func updateRound():
	var enemies = ["laser", "ball", "triangle", "square"]
	roundNum += 1
	
	addEnemy(enemies[rng.randi_range(0, 3)])
	
func addEnemy(enemyName: String):
	if enemyName == "laser":
		addLaser()
		return
	
	var enemy: PackedScene
	if enemyName == "ball":
		enemy = ball
	elif enemyName == "triangle":
		enemy = triangle
	elif enemyName == "square":
		enemy = square
	
	var x: float
	var y: float
	var breaking = false
	while !breaking:
		if enemyName == "triangle":
			x = rng.randf_range(20, viewportRect.size.x-20)
			y = viewportRect.size.y
		else:
			if rng.randi_range(0, 1) == 0:
				if rng.randi_range(0, 1) == 0:
					x = 20
				else:
					x = -20
				y = rng.randf_range(20, viewportRect.size.y-20)
			else:
				x = rng.randf_range(20, viewportRect.size.x-20)
				if rng.randi_range(0, 1) == 0:
					y = 20
				else:
					y = -20
		
		breaking = true
		if (player.position.x - x)**2 + (player.position.y - y)**2 <= 30**2:
			breaking = false
			
	var new_enemy = enemy.instantiate()
	new_enemy.position = Vector2(x, y)
	add_child(new_enemy)


func addLaser():
	var breaking = false
	while !breaking:
		var x = rng.randf_range(100, viewportRect.size.x-100)
		var y = rng.randf_range(100, viewportRect.size.y-100)
		
		# Go through every laser position and see if they overlap
		breaking = true
		for pos in lasers:
			# if 2 lasers are within 30px, choose new positions
			if (pos[0] - x)**2 + (pos[1] - y)**2 <= 30**2:
				breaking = false
				break

		var new_laser = laser.instantiate()
		new_laser.position = Vector2(x, y)
		add_child(new_laser)
		lasers.append([x, y])
