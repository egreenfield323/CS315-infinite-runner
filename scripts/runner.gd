extends Node2D

func endGame():
	$InfinitePlayer.speed = 0
	await get_tree().create_timer(1.0).timeout
	$InfinitePlayer/Camera2D/Control.visible = true
