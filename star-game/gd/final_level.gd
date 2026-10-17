
extends Node2D

var score: int = 0
var game_over := false
var level_completed := false

@export var total_coins: int = 8
@export var level_one_path: String = "res://tscn/level.tscn"
@export var title_screen_path: String = "res://tscn/title_scren.tscn"

@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var game_over_ui: Control = $CanvasLayer/GameOverUI
@onready var restart_button: Button = $CanvasLayer/GameOverUI/CenterContainer/VBoxContainer/RestartButton
@onready var level_complete_ui: Control = $CanvasLayer/LevelCompleteUI
@onready var home_button: Button = $CanvasLayer/LevelCompleteUI/CenterContainer/VBoxContainer/HomeButton

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false

	score = 0
	game_over = false
	level_completed = false

	game_over_ui.hide()
	level_complete_ui.hide()

	restart_button.pressed.connect(_on_restart_pressed)
	home_button.pressed.connect(_on_home_pressed)

	update_score()

func _process(_delta: float) -> void:
	if game_over or level_completed:
		return

	var player := get_node_or_null("Player")

	if player and player.global_position.y > 1000:
		show_game_over()

func add_score() -> void:
	if game_over or level_completed:
		return

	score += 1
	update_score()
	print("Final Level score: ", score, "/", total_coins)

	if score >= total_coins:
		show_level_complete()

func update_score() -> void:
	score_label.text = "Coins: " + str(score) + "/" + str(total_coins)

func show_game_over() -> void:
	game_over = true
	game_over_ui.show()
	get_tree().paused = true

func show_level_complete() -> void:
	level_completed = true
	level_complete_ui.show()
	get_tree().paused = true

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(level_one_path)

func _on_home_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(title_screen_path)
