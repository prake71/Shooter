extends Node2D

var is_game_over = false

var asteroid_scene = preload("res://scenes/asteroid/asteroid.tscn")
const SCREEN_WIDTH = 320
const SCREEN_HEIGHT = 180
var score = 0

func _ready():
	get_node("player").connect("destroyed", self, "_on_player_destroyed")
	get_node("spawn_timer").connect("timeout", self, "_on_spawn_timer_timeout")
	
	
func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if is_game_over and Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://scenes/stage/stage.tscn")
		
func _on_player_destroyed():
	is_game_over = true
	get_node("ui/retry").show()
	
	
func _on_spawn_timer_timeout():
	var asteroid_instance = asteroid_scene.instance()
	asteroid_instance.position = Vector2(SCREEN_WIDTH + 8, rand_range(0, SCREEN_HEIGHT))
	asteroid_instance.connect("score", self, "_on_player_score")
	add_child(asteroid_instance)
	
func _on_player_score():
	score += 1
	get_node("ui/score").text = "Score: " + str(score)
	
