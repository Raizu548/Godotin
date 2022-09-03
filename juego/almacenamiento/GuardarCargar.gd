class_name GuardarCargar
extends Node

enum {JUEGO, CONFIG}


## Guardar datos
func guardar_datos_json(datos_a_guardar: Dictionary) -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADOS:
		return -1
	
	var archivo: File = File.new()
	
	var resultado: int = archivo.open(seleccionar_ruta(".json", JUEGO), File.WRITE)
	if resultado == OK:
		archivo.store_line(to_json(datos_a_guardar))
		archivo.close()
	
	return resultado


func guardar_datos_tres(datos_a_guardar: Dictionary) -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADOS:
		return -1
	
	var datos: DatosJuegoGuardado = DatosJuegoGuardado.new()
	datos.nombre = datos_a_guardar.nombre
	
	var resultado: int = ResourceSaver.save(seleccionar_ruta(".tres", JUEGO), datos)
	
	return resultado


func guardar_datos_configuracion() -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADOS:
		return -1
	
	var ruta: String = seleccionar_ruta(".tres", CONFIG)
	
	var datos: DatosAjustesGuardados = DatosAjustesGuardados.new()
	datos.pantalla_completa = OS.window_fullscreen
	datos.pantalla_resolucion = OS.window_size
	datos.volumen_buses = {
			"master": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")),
			"musica": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Musica")),
			"sfx": AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")),
	}
	
	var resultado: int = ResourceSaver.save(ruta,datos)
	return resultado
	


func seleccionar_ruta(tipo_extension: String, archivo: int) -> String:
	var ruta: String
	
	if OS.is_debug_build():
		ruta = DatosConfiguracion.RUTA_GUARDADO_DEBUG
	else:
		ruta = DatosConfiguracion.RUTA_GUARDADO_RELEASE
	
	chequear_existencia_directorio(ruta)
	
	match archivo:
		JUEGO:
			ruta += DatosConfiguracion.NOMBRE_ARCHIVO_DATOS + tipo_extension
		CONFIG:
			ruta += DatosConfiguracion.NOMBRE_ARCHIVO_CONFIG + tipo_extension
		_:
			printerr("No existe ese tipo de archivo")
	
	return ruta


func chequear_existencia_directorio(ruta: String) -> void:
	var dir = Directory.new()
	if not dir.dir_exists(ruta):
		Directory.new().make_dir_recursive(ruta)


## Cargar Datos
func cargar_datos_json() -> Dictionary:
	if not OS.get_name() in  DatosConfiguracion.OS_ADMITIDOS_GUARDADOS:
		return {}
	
	var archivo: File = File.new()
	
	var resultado: int = archivo.open(seleccionar_ruta(".json", JUEGO), File.READ)
	if resultado == OK:
		var datos_cargados: Dictionary = parse_json(archivo.get_line())
		archivo.close()
		
		return datos_cargados
	
	return {}


func cargar_datos_tres() -> Dictionary:
	var datos: Resource = load(seleccionar_ruta(".tres", JUEGO))
	
	return{
		"nombre": datos.nombre
	}


func cargar_datos_configuracion() -> void:
	var ruta: String = seleccionar_ruta(".tres",CONFIG)
	var dir: Directory = Directory.new()
	if not dir.file_exists(ruta):
		guardar_datos_configuracion()
	else:
		var datos: Resource = load(ruta)
		OS.window_fullscreen = datos.pantalla_completa
		OS.window_size = datos.pantalla_resolucion
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),
				datos.volumen_buses.master)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"),
				datos.volumen_buses.musica)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),
				datos.volumen_buses.sfx)
		
		var tamanio_pantalla := OS.get_screen_size()
		OS.set_window_position((tamanio_pantalla - datos.pantalla_resolucion) * 0.5)


## Borrar datos
func borrar_datos() -> int:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADOS:
		return -1
	
	var dir = Directory.new()
	var resultado: int = dir.remove(seleccionar_ruta(".tres", JUEGO))
	
	return resultado
