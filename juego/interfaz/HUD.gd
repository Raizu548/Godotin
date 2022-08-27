extends Control

onready var etiqueta_vidas = $ContenedorVida/Cantidad
onready var etiqueta_monedas_oro = $ContenedorMonedaDorada/Cantidad


func _ready():
# warning-ignore:return_value_discarded
	Evento.connect("actualizar_hud", self, "actualizar_hud")
	actualizar_hud()


func actualizar_hud():
	etiqueta_vidas.text = "%s" % DatosPlayer.get_vida()
	etiqueta_monedas_oro.text = "%s" % DatosPlayer.get_moneda_oro()
