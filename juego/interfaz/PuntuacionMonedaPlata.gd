extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosPlayer.get_moneda_plata() + "x %s" % DatosPlayer.get_punto_plata() +  " = %s" % DatosPlayer.puntaje_tot_plata()
