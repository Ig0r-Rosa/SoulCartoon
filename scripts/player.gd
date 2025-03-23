extends CharacterBody3D

@export var velocidade = 5.0
@export var forca_pulo = 5
@export var gravidade = 9.8

func _physics_process(delta):
	# Aplica a gravidade
	if not is_on_floor():
		velocity.y -= gravidade * delta

	# Captura entrada do jogador
	var direcao = Vector3.ZERO
	if Input.is_action_pressed("mover_frente"):
		direcao.z += 1
	if Input.is_action_pressed("mover_tras"):
		direcao.z -= 1
	if Input.is_action_pressed("mover_esquerda"):
		direcao.x += 1
	if Input.is_action_pressed("mover_direita"):
		direcao.x -= 1

	# Normaliza direção para evitar velocidade maior em diagonal
	direcao = direcao.normalized()

	# Movimenta o personagem
	velocity.x = direcao.x * velocidade
	velocity.z = direcao.z * velocidade

	# Pulo
	if Input.is_action_just_pressed("pular") and is_on_floor():
		velocity.y = forca_pulo

	move_and_slide()
