extends Area2D

onready var imagen: Sprite = $Sprite

var diccionario_simbolos: Dictionary = {
	'teatro': "res://assets/Cartography Pack/PNG/Retina/tent.png",
	'museo': "res://assets/Cartography Pack/PNG/Retina/castle.png",
	'casas_artesanias': "res://assets/Cartography Pack/PNG/Retina/houseSmall.png"
}


#func _on_SimboloMapa_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#	if event is InputEventScreenTouch and event.is_pressed():
#		print('Presionado')



