extends CharacterBody2D

@export var velocidad: float = 100.0

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	var direccion = Input.get_vector(
		"ui_left", "ui_right", "ui_up", "ui_down"
	)

	# Detectar si el jugador presiona una tecla
	if direccion != Vector2.ZERO:
		print("Movimiento detectado: ", direccion)

	# Movimiento del personaje
	velocity = direccion * velocidad
	move_and_slide()

	# Animaciones del personaje
	if direccion != Vector2.ZERO:
		if abs(direccion.x) > abs(direccion.y):
			if direccion.x > 0:
				sprite.play("Caminar_Derecha")
			else:
				sprite.play("Caminar_Izquierda")
		else:
			if direccion.y > 0:
				sprite.play("Caminar_Abajo")
			else:
				sprite.play("Caminar_Arriba")
	else:
		sprite.stop()
