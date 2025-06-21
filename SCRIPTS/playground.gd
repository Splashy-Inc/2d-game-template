extends Level

func _level_ready():
	var new_timer := Timer.new()
	new_timer.one_shot = true
	add_child(new_timer)
	new_timer.start(3.0)
	await new_timer.timeout
	new_timer.queue_free()
	Globals.update_info("Updated")
