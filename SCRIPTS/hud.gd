extends Control


func _on_pause_button_pressed() -> void:
	$PauseMenu.pause()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_on_pause_button_pressed()
