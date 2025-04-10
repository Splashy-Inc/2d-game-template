extends CanvasLayer

class_name HUD

signal play_pressed
signal restart_pressed
signal quit_pressed

@onready var menu_screens: Control = $MenuScreens
@onready var menu_back_ground: ColorRect = $MenuScreens/MenuBackGround
@onready var main_menu: Control = $MenuScreens/MainMenu
@onready var controls_screen: Control = $MenuScreens/ControlsScreen
@onready var win_screen: Control = $MenuScreens/WinScreen
@onready var loss_screen: Control = $MenuScreens/LossScreen

func _ready():
	pass

func _process(delta):
	pass

func hide_menus():
	hide_menu_screens()

func _clear_menu():
	for child in menu_screens.get_children():
		if child != menu_back_ground:
			child.hide()

func show_menu_screens():
	menu_screens.show()

func hide_menu_screens():
	_clear_menu()
	menu_screens.hide()

func _on_controls_screen_exited():
	show_main_menu()

func _show_controls():
	_clear_menu()
	show_menu_screens()
	controls_screen.show()

func show_main_menu():
	_clear_menu()
	show_menu_screens()
	main_menu.show()

func show_win_screen():
	_clear_menu()
	show_menu_screens()
	win_screen.show()

func show_loss_screen():
	_clear_menu()
	show_menu_screens()
	loss_screen.show()

func _on_game_menu_button_pressed(type: String):
	match type:
		"Play":
			play_pressed.emit()
		"Restart":
			restart_pressed.emit()
		"Controls":
			_show_controls()
		"Main menu":
			show_main_menu()
		"Quit":
			quit_pressed.emit()
