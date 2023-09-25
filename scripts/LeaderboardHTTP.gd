extends HTTPRequest

var board_entry = preload("res://tools/board entry.tscn")

func _ready():
	HelpMusic.play()
	
	var url = "https://api.lootlocker.io/game/v2/session/guest"
	var header = ["Content-Type: application/json"]
	var method = HTTPClient.METHOD_POST
	var data = {"game_key": "dev_36155fb38f734521b52e75f723f6c222", "game_version": "1.0"}
	
	request(url, header, method, JSON.stringify(data))
	
	var response = (await self.request_completed)[3]
	var token = JSON.parse_string(response.get_string_from_utf8())["session_token"]
	
	var leaderboards = ["17951", "17968", "17969", "17970"]
	var leaderboard_names = ["normal", "double", "hell", "laser"]
	
	for l in range(len(leaderboards)):
		url = "https://api.lootlocker.io/game/leaderboards/%s/list?count=5" % leaderboards[l]
		header = ["Content-Type: application/json", "x-session-token: %s" % token]
		method = HTTPClient.METHOD_GET
		
		request(url, header, method)
		
		response = (await self.request_completed)[3]
		response = JSON.parse_string(response.get_string_from_utf8())["items"]
		
		var player_list = get_parent().get_node("HBoxContainer/%s/ScorePanel/PlayerList" % leaderboard_names[l])
		
		for dict in response:
			var entry = board_entry.instantiate()
			entry.get_node("NameLabel").text = dict["member_id"]
			entry.get_node("ScoreLabel").text = str(dict["score"])
			player_list.add_child(entry)


func _on_main_menu_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	HelpMusic.stop()
