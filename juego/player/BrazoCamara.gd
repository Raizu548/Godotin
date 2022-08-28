extends SpringArm

## Atributos export
export var velocidad_mov_camara: Vector2 = Vector2(0.10, 0.10)
export var rango_rotacion_camara_x: Vector2 = Vector2(-90.0, 30.0)
export var rango_rotacion_camara_y: Vector2 = Vector2(0.0, 360.0)
export var camara_x_invertida: bool = false
export var camara_y_intertida: bool = false


## Metodos
func _ready() -> void:
	set_as_toplevel(true) #No sea afectado por el padre
	velocidad_mov_camara *= chequear_camara_invertida()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(evento: InputEvent) -> void:
	if evento is InputEventMouseMotion:
		# Movimiento alrededor del eje X (arriba/abajo)
		rotation_degrees.x += evento.relative.y * velocidad_mov_camara.y
		rotation_degrees.x = clamp(rotation_degrees.x,rango_rotacion_camara_x.x, rango_rotacion_camara_x.y)
		
		# Movimiento alrededor del eje Y (derecha/izquierda)
		rotation_degrees.y -= evento.relative.x * velocidad_mov_camara.x
		rotation_degrees.y = wrapf(rotation_degrees.y, rango_rotacion_camara_y.x, rango_rotacion_camara_y.y)
	
	# Solo debug
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


## Metodos personalizados
func chequear_camara_invertida() -> Vector2:
	var vector_camara = Vector2(1,1)
	if camara_x_invertida:
		vector_camara.x = -1
	
	if camara_y_intertida:
		vector_camara.y = -1
	
	return vector_camara
