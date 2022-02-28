extends TileMap

var simbolo_mapa := preload("res://Pruebas/SimboloMapa.tscn")

onready var llamada_museo: HTTPRequest = $LlamadaMuseos

func _ready() -> void:
	
	llamada_museo.request('https://sic.cultura.gob.mx/opendata/d/0_museo_directorio.json')
	
	for i in range(10):
		randomize()
		var celda := Vector2(rand_range(-5, 20), rand_range(-5, 20))
		var id_cuadro := 2
		set_cellv(celda, id_cuadro)
#
#	var celdas_usadas_museo := get_used_cells_by_id(2)
#
#	print(celdas_usadas_museo)
#
#	for cuadro in celdas_usadas_museo:
#		if get_cell_autotile_coord(cuadro[0], cuadro[1]) == Vector2(0, 0) or get_cell_autotile_coord(cuadro[0], cuadro[1]) == Vector2(2, 0):
#			var s = simbolo_mapa.instance()
#			s.position = map_to_world(cuadro)
#			add_child(s)
			#print(s.diccionario_simbolos)
	
func _on_LlamadaMuseos_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var resultado := JSON.parse(body.get_string_from_utf8())
	for r in resultado.result:
		if r['nom_ent'] == 'Nuevo León': #and r['nom_mun'] == 'Cuauhtémoc':
			var celda := Vector2(rand_range(-5, 20), rand_range(-5, 20))
			var id_cuadro := 0
			set_cellv(celda, id_cuadro)
			print(r['nom_mun'])
	
			
	var celdas_usadas_museo := get_used_cells_by_id(0)
	#print(celdas_usadas_museo)
	#print(GlobalDatosEc.datos_museos['r']['museo_nombre'])

	for cuadro in celdas_usadas_museo:
		if get_cell_autotile_coord(cuadro[0], cuadro[1]) == Vector2(0, 0) or get_cell_autotile_coord(cuadro[0], cuadro[1]) == Vector2(2, 0):
			var s = simbolo_mapa.instance()
			s.position = map_to_world(cuadro)
			add_child(s)
			s.scale.x = 0.5
			s.scale.y = 0.5
			s.imagen.texture = load(s.diccionario_simbolos['museo'])
#	clear()
#			s.connect("input_event", self, "_on_SimboloMapa_input_event")


#func _on_SimboloMapa_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
#	print(GlobalDatosEc.datos_museos.result)

