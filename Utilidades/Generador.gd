extends Node2D

export (PackedScene) var escena_simbolo: PackedScene

onready var llamada_api: Node2D = $LlamadaAPI


func _ready() -> void:
	llamada_api.llamada_teatros.connect("request_completed", self, "_on_LlamadaTeatros_request_completed")
	llamada_api.llamada_museos.connect("request_completed", self, "_on_LlamadaMuseos_request_completed")


func _on_LlamadaTeatros_request_completed(result: int, response_code: int, 
		headers: PoolStringArray, body: PoolByteArray) -> void:
	var resultado := JSON.parse(body.get_string_from_utf8())
	for r in resultado.result:
		if r['nom_ent'] == 'Nuevo León' and r['nom_mun'] == 'Monterrey':
			print(r['teatro_nombre'])
			var simbolo = escena_simbolo.instance()
			add_child(simbolo)
			randomize()
			simbolo.global_position = Vector2(rand_range(0, 720), rand_range(0, 1080))
			simbolo.imagen.texture = load(simbolo.diccionario_simbolos['teatro'])
			simbolo.reproductor_animaciones.play('aparecer')


func _on_LlamadaMuseos_request_completed(result: int, response_code: int, 
		headers: PoolStringArray, body: PoolByteArray) -> void:
	var resultado := JSON.parse(body.get_string_from_utf8())
	for r in resultado.result:
		if r['nom_ent'] == 'Nuevo León' and r['nom_mun'] == 'Monterrey':
			print(r['museo_nombre'])
			var simbolo = escena_simbolo.instance()
			add_child(simbolo)
			randomize()
			simbolo.global_position = Vector2(rand_range(0, 720), rand_range(0, 1080))
			simbolo.imagen.texture = load(simbolo.diccionario_simbolos['museo'])
			simbolo.reproductor_animaciones.play('aparecer')
