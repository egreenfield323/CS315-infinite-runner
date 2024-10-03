extends Area2D


func _on_body_entered(body) -> void:
	body.hit()
	get_parent().get_parent().endGame()
pass
