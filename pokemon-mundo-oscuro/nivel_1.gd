
extends Node2D

func _on_zona_puerta_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		print("¡Una explosión sacude el pueblo!")
		print("¡Que fue ese estruendo sono cerca del laboratorio Pokémon!")
		print("¡Debo ir a investigar!")

		get_tree().call_deferred("change_scene_to_file", "res://EscenaExterior.tscn")
