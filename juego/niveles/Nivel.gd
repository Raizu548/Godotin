tool
extends Node

## Variables export
export var nivel_actual = ""
export var menu_game_over = ""
export var numero_nivel: int = 0
export(String, FILE, "*.tscn") var proximo_nivel = ""


## Metodos
func _ready() -> void:
	DatosJuego.nivel_actual = get_tree().current_scene.filename
	DatosJuego.num_nivel_actual = numero_nivel
	DatosJuego.nivel_proximo = proximo_nivel
	Evento.connect("game_over", self, "game_over")


## Metodos personalizados
func game_over() -> void:
	get_tree().change_scene(menu_game_over)


func _get_configuration_warning() -> String:
	if numero_nivel == 0 or proximo_nivel == "":
		return "chequear valores de nivel"
	
	return ""
