

extends CharacterBody2D

@export var velocidad: float = 65.0
@export var distancia_parada: float = 25.0

var jugador_detectado: CharacterBody2D = null
var posicion_inicial: Vector2

func _ready() -> void:
	posicion_inicial = global_position

func _physics_process(_delta: float) -> void:
	var destino: Vector2 = posicion_inicial

	if is_instance_valid(jugador_detectado):
		destino = jugador_detectado.global_position

	var distancia = global_position.distance_to(destino)

	if distancia > distancia_parada:
		var direccion = global_position.direction_to(destino)
		velocity = direccion * velocidad
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _on_detectorjugador_body_entered(body: Node2D) -> void:
	if body.name == "Jugador" and body is CharacterBody2D:
		jugador_detectado = body
		print("¡Arcanine ha detectado al jugador!")

func _on_detectorjugador_body_exited(body: Node2D) -> void:
	if body == jugador_detectado:
		jugador_detectado = null
		print("Arcanine regresa a su puesto.")
