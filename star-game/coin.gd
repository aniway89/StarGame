
extends Area2D

var collected := false

func _on_body_entered(body: Node2D) -> void:
	if collected:
		return

	if body is CharacterBody2D:
		var level := get_tree().current_scene

		if level and level.has_method("add_score"):
			collected = true
			level.add_score()
			queue_free()
		else:
			print("ERROR: Current level has no add_score() function!")
