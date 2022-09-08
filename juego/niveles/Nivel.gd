tool
extends Node

## Variables export
export var nivel_actual = ""
export var menu_game_over = ""
export var numero_nivel: int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""

var guardar: GuardarCargar = GuardarCargar.new()

## Metodos
func _ready() -> void:
	guardar.guardar_datos_juego()
	print("se guardo")
	Evento.connect("game_over", self, "game_over")
	yield(get_tree().create_timer(4.0), "timeout")
	print("despues del yield")
	actualizar_datos()


## Metodos personalizados
func actualizar_datos() -> void:
	DatosJuego.nivel_actual = get_tree().current_scene.filename
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.nivel_proximo = proximo_nivel


func game_over() -> void:
	get_tree().change_scene(menu_game_over)


func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "chequear valores de nivel"
	
	return ""
