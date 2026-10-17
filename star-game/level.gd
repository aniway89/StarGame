
extends Node2D

var score: int = 0

@export var total_coins: int = 6
@export_file("*.tscn") var final_level_path: String = "res://final_level.tscn"

@onready var score_label: Label = $CanvasLayer/ScoreLabel

var level_completed := false

func _ready() -> void:
	score = 0
	level_completed = false
	update_score()

func add_score() -> void:
	if level_completed:
		return

	score += 1
	update_score()
	print("Level 1 score: ", score, "/", total_coins)

	if score >= total_coins:
		level_completed = true
		score_label.text = "Level Complete!"
		print("Level 1 complete! Loading Final Level...")
		get_tree().change_scene_to_file(final_level_path)

func update_score() -> void:
	score_label.text = "Coins: " + str(score) + "/" + str(total_coins)
