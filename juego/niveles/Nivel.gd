extends Node

export var nivel_actual = ""
export var menu_game_over = ""

func _ready() -> void:
	DatosPlayer.set_nivel_actual(nivel_actual)
	Evento.connect("game_over", self, "game_over")
	

func game_over() -> void:
	print("Metodo game over")
	print("Escena a cambiar: ", menu_game_over)
	get_tree().change_scene(menu_game_over)
