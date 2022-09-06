extends Spatial

export(String, "activada", "activadaMovimiento") var animacion
export var frame_inicio: float = 0.0


func _ready() -> void:
	$AnimationPlayer.play(animacion)
	$AnimationPlayer.advance(frame_inicio)


func _on_SierraArea_body_entered(body: Node) -> void:
	var player: Godotin = body
	player.respawn()
