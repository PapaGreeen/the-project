extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Level_0.tscn")

func _on_settings_button_pressed():
	print("Settings screen coming soon!")

func _on_quit_button_pressed():
	get_tree().quit()
