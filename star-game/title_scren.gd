extends Node2D
@export var level_one_path: String = "res://level.tscn"
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(level_one_path)

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_setting_button_pressed() -> void:
	pass # Replace with function body.
