extends Node

class_name Level

func _ready() -> void:
	for child in get_children():
		if child is DialogBox:
			child.dialog_ended.connect(_on_dialog_ended.bind(child))

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_dialog_ended(dialog_box: DialogBox):
	print_debug("Dialog ended: ", dialog_box)
