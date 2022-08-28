extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosJuego.get_moneda_oro() + "x %s" % DatosJuego.get_punto_oro() +  " = %s" % DatosJuego.puntaje_tot_oro()
