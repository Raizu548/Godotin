class_name PortalNivel
extends Area

export(String, FILE, "*.tscn") var proximo_nivel = ""

func _on_body_entered(body: Node) -> void:
	if proximo_nivel != "":
		DatosJuego.actualizar_monedas_pasar_nivel()
		get_tree().change_scene(proximo_nivel)
