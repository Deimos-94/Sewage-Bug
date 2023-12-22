extends Control

func _ready():
	$MarginContainer/VBoxContainer/Play.grab_focus()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://TestArea.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_fullscreen_button_down():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_fullscreen_button_up():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
