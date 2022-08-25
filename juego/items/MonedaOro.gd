class_name Moneda
extends Area

func _ready() -> void:
	print($AnimationPlayer.current_animation)
	

func _on_body_entered(body: Node) -> void:
	print("Consumio moneda")
	print(body.name)
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
