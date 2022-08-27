extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosPlayer.get_moneda_oro() + "x %s" % DatosPlayer.get_punto_oro() +  " = %s" % DatosPlayer.puntaje_tot_oro()
