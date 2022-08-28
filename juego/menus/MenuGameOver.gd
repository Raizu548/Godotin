extends Control

var nivel_actual = ""

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	nivel_actual = DatosJuego.get_nivel_actual()


func _on_BotonSalir_pressed() -> void:
	get_tree().quit()


func _on_BotonReintentar_pressed() -> void:
	DatosJuego.reset()
	get_tree().change_scene(nivel_actual)
