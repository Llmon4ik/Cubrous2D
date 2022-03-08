extends Label

onready var player = $"../../.."
onready var tilemap = $"../../../../TileMap"

func _process(delta):
	var info = [tilemap.world_to_map(player.position), 
		player.velocity, 
		player.mouse_position,
		tilemap.item_name[tilemap.get_title(player.mouse_position[0], player.mouse_position[1]).id],
		tilemap.get_title(player.mouse_position[0], player.mouse_position[1]).id,
		tilemap.item_name[player.current_block]]
	
	text = """Player Position: %s
	Velocity: %s
	Cursor Position: %s
	Block on cursor: %s (%s)
	Current block: %s""" % info
