extends Node

@export var level_scene: PackedScene

@onready var hud: HUD = $HUD

var level
var game_ended = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_level(level_scene)
	show_main_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _resume_play(mouse_mode: int = Input.MOUSE_MODE_VISIBLE):
	hud.hide_menus()
	if level.has_method("resume_play"):
		level.resume_play(mouse_mode)

func _pause_play():
	if level.has_method("pause_play"):
		level.pause_play()

func show_main_menu():
	_pause_play()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	hud.show_main_menu()

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	if game_ended:
		_on_restart_pressed()
	else:
		_resume_play()

func _input(event):
	if event.is_action_pressed("menu"):
		show_main_menu()

func _restart_level():
	game_ended = false
	if level:
		level.free()
	
	var new_level = level_scene.instantiate()
	add_child(new_level)
	for sig in new_level.get_signal_list():
		match sig["name"]:
			"lost":
				new_level.lost.connect(_on_level_lost)
			"won":
				new_level.won.connect(_on_level_won)
	
	# Sample code in case there's a tutorial level in the game that would use it
	#for sig in new_level.get_signal_list():
		#if sig["name"] == "tutorial_completed":
			#new_level.tutorial_completed.connect(_on_tutorial_won)
			#break
	
	level = new_level

func _on_restart_pressed():
	_restart_level()
	_resume_play()

func _on_level_lost():
	game_ended = true
	hud.show_loss_screen()

func _on_level_won():
	game_ended = true
	_pause_play()
	hud.show_win_screen()

func _on_level_selected(new_level_scene: PackedScene):
	_set_level(new_level_scene)

func _set_level(new_level_scene: PackedScene):
	level_scene = new_level_scene
	Globals.cur_level_scene = level_scene
	_restart_level()
	_resume_play()
