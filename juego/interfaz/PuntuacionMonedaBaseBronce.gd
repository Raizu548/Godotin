extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosJuego.get_moneda_bronce() + "x %s" % DatosJuego.get_punto_bronce() +  " = %s" % DatosJuego.puntaje_tot_bronce()
