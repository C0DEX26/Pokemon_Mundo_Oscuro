
extends Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_entrada_casa_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		get_tree().call_deferred("change_scene_to_file", "res://nivel_1.tscn")
