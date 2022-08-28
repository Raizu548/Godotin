extends Node

## Atributos
var vida: int = 3
var moneda_oro: int = 0
var nivel_actual: String = ""
var num_nivel_actual: int = 0
var nivel_proximo: String = ""
var puntaje: int = 0

## Getter and setter
func get_vida() -> int:
	return vida

func get_moneda_oro() -> int:
	return moneda_oro

func get_nivel_actual() -> String:
	return nivel_actual

func set_nivel_actual(nuevo_nivel: String) -> void:
	nivel_actual = nuevo_nivel

## Metodos Personalizados
func reset() -> void:
	vida = 3
	moneda_oro = 0
	puntaje = 0

func generar_puntaje() -> int:
	var valor_oro = moneda_oro * 10
	puntaje = valor_oro
	return puntaje

func restar_vida() -> void:
	vida -= 1
	if vida == 0:
		print("0 vidas")
		Evento.emit_signal("game_over")
	else:
		get_tree().reload_current_scene()
	
	Evento.emit_signal("actualizar_hud")

func sumar_monedas():
	moneda_oro += 1
	Evento.emit_signal("actualizar_hud")
