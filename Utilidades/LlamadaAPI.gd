extends Node2D

onready var llamada_teatros: HTTPRequest = $LlamadaTeatros
onready var llamada_museos: HTTPRequest = $LlamadaMuseos


func _ready() -> void:
	llamada_teatros.request('https://sic.cultura.gob.mx/opendata/d/0_teatro_directorio.json')
	llamada_museos.request('https://sic.cultura.gob.mx/opendata/d/0_museo_directorio.json')


