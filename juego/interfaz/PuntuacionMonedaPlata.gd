extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosJuego.get_moneda_plata() + "x %s" % DatosJuego.get_punto_plata() +  " = %s" % DatosJuego.puntaje_tot_plata()
