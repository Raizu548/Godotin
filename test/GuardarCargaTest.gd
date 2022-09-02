extends Node


func _on_BotonGuardado_pressed() -> void:
	if $NombreJSON.text != "":
		var guardar: GuardarCargar = GuardarCargar.new()
		var resultado: int = guardar.guardar_datos_json({"nombre": $NombreJSON.text})
		
		$TextoResultadoJASON.text = "%s" % resultado
	else:
		$TextoResultadoJASON.text = "El campo no puede estar vacio"


func _on_BotonCargar_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	var datos: Dictionary = cargar.cargar_datos_json()
	if not datos.empty():
		$NombreJSON.text = datos.nombre
		$TextoResultadoJASON.text = "Carga Exitosa"
	else:
		$TextoResultadoJASON.text = "Error en la carga"


func _on_BotonGuardadoGodot_pressed() -> void:
	if $NombreTRES.text != "":
		var guardar: GuardarCargar = GuardarCargar.new()
		var resultado: int = guardar.guardar_datos_tres(
			{
				"nombre": $NombreTRES.text
			}
		)
		$TesxtoResultadoTRES.text = "%s" % resultado
	else:
		$TesxtoResultadoTRES.text = "El campo no puede estar vacio"


func _on_BotonCargarGodot_pressed() -> void:
	var cargar: GuardarCargar = GuardarCargar.new()
	var datos: Dictionary = cargar.cargar_datos_tres()
	if not datos.empty():
		$NombreTRES.text = datos.nombre
		$TesxtoResultadoTRES.text = "Carga Exitosa"
	else:
		$TesxtoResultadoTRES.text = "Error a la carga"


func _on_BotonBorrar_pressed() -> void:
	var borrar: GuardarCargar = GuardarCargar.new()
	var resultado: int = borrar.borrar_datos()
	$TesxtoResultadoTRES.text = "%s" % resultado
