extends Control

export(String, FILE, "*.tscn") var pantalla_carga


# Varibales onready
onready var titulo: Label = $Titulo
onready var puntos: Label = $Puntos

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	titulo.text = "Nivel {num} Completo".format({"num":DatosJuego.num_nivel_actual})
	puntos.text = "{puntos}\nPuntos Totales".format({"puntos":DatosJuego.generar_puntaje()})
	

func _on_BotonNivel_pressed() -> void:
	# DatosJuego.nivel_actual = DatosJuego.nivel_proximo
	DatosJuego.nivel_actual = DatosJuego.nivel_proximo
	get_tree().change_scene(pantalla_carga)
