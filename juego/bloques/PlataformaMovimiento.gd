extends Spatial

export var frame_inicio: float = 0.0

func _ready() -> void:
	$AnimationPlayer.advance(frame_inicio)
