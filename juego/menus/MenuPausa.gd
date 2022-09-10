extends Control

export(String, FILE, "*.tscn") var menu_inicial


func _ready() -> void:
	visible = false


func _input(event) -> void:
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_BotonReanudar_pressed() -> void:
	visible = not visible
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_BotonMenuPrincipal_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene(menu_inicial)


func _on_BotonSalir_pressed() -> void:
	get_tree().quit()

