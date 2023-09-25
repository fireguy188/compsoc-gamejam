extends HTTPRequest

var token = ""

func _ready():
	var url = "https://api.lootlocker.io/game/v2/session/guest"
	var header = ["Content-Type: application/json"]
	var method = HTTPClient.METHOD_POST
	var data = {"game_key": "dev_36155fb38f734521b52e75f723f6c222", "game_version": "1.0"}
	
	request(url, header, method, JSON.stringify(data))
	var response = (await self.request_completed)[3]
	token = JSON.parse_string(response.get_string_from_utf8())["session_token"]

func send_score(score: int):
	var mode_dict = {"normal": "17951", "double": "17968", "hell": "17969", "laser": "17970"}
	var url = "https://api.lootlocker.io/game/leaderboards/%s/submit" % mode_dict[Globals.mode]
	var header = ["Content-Type: application/json", "x-session-token: %s" % token]
	var method = HTTPClient.METHOD_POST
	var data = {"member_id": Globals.username, "score": score}
	
	request(url, header, method, JSON.stringify(data))
