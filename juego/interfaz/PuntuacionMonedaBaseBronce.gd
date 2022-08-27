extends "res://juego/interfaz/PuntuacionMonedaBase.gd"


func mostrar_puntuacion():
	return "%s " % DatosPlayer.get_moneda_bronce() + "x %s" % DatosPlayer.get_punto_bronce() +  " = %s" % DatosPlayer.puntaje_tot_bronce()
