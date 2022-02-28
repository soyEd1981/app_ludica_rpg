extends Node2D

onready var camara: Camera2D = $Camera2D


func _ready() -> void:

	#GlobalDatosEc.llamada.emit_signal("request_completed")
#	for c in $Colocador.tile_set.get_tiles_ids():
#		print($Colocador.tile_set.tile_get_name(c))

	#print($TileMap.tile_set.get_tiles_ids())
	
	
#	for c in $TileMap.tile_set.get_tiles_ids():
#		print($TileMap.tile_set.tile_get_name(c))
#		randomize()
#		var celda = Vector2(rand_range(0, 9), rand_range(0, 9))
#		var id_cuadro = randi() % $TileMap.tile_set.get_tiles_ids().size()
#		print(id_cuadro, ' ', celda)
#		$TileMap.set_cellv(celda, id_cuadro)

	
#	var celda := Vector2(0, 0)
#	var id_cuadro := 3
#	$TileMap.set_cellv(celda, id_cuadro)
	pass


func _process(delta: float) -> void:
	camara.limit_top = -1950 #-420
	camara.limit_bottom = 3150 #1650
	camara.limit_right = 3050 #1200
	camara.limit_left = -2050 #-300


func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		camara.move_local_x(-event.relative.x)
		camara.move_local_y(-event.relative.y)




	








