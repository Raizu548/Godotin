extends Control

var nivel_actual = ""

func _ready() -> void:
	nivel_actual = DatosPlayer.get_nivel_actual()


func _on_BotonSalir_pressed() -> void:
	get_tree().quit()


func _on_BotonReintentar_pressed() -> void:
	DatosPlayer.reset()
	get_tree().change_scene(nivel_actual)
