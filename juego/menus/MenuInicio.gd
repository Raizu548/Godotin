tool
extends Control

export(String, FILE, "*.tscn") var menu_ajustes = ""
export(String, FILE, "*.tscn") var nivel_inicial = ""
export(String, FILE, "*.tscn") var pantalla_carga = ""



## Metodos
func _get_configuration_warning() -> String:
	if menu_ajustes == "":
		return "Falta asignar la ruta del menu de ajustes"
	return ""


## Señales internas
func _on_BotonSalir_pressed() -> void:
	get_tree().quit()


func _on_BotonOpciones_pressed() -> void:
	$BotonSFX.play()
	get_tree().change_scene(menu_ajustes)


func _on_BotonNuevo_pressed() -> void:
	DatosJuego.nivel_actual = nivel_inicial
	get_tree().change_scene(pantalla_carga)
