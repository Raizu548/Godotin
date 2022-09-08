extends Control

export(String, FILE, "*.tscn") var menu_principal

onready var puntos: Label = $LabelPuntaje

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	puntos.text = "Puntaje: {puntos}".format({"puntos":DatosJuego.generar_puntaje()})

func _on_BotonMenuPrincipal_pressed() -> void:
	get_tree().change_scene(menu_principal)
