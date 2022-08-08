extends Camera2D

@onready
var tile_map:TileMap = get_node("../../../TileMap")

func _ready():
	var map_limits = tile_map.get_used_rect()
	var map_cellsize = tile_map.tile_set.tile_size
	limit_left = map_limits.position.x * map_cellsize.x
	limit_right = map_limits.end.x * map_cellsize.x
	limit_top = 0
	limit_bottom = map_limits.end.y * map_cellsize.y
