extends Area2D

signal level_started

func _on_Start_Flag_body_entered(body):
	if(body.get_name() == "Player"):
		emit_signal("level_started")
