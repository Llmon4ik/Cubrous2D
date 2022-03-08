extends TileMap

enum ID {
	EMPTY = -1,
	DIRT = 0,
	STONE = 1,
	ORE_COAL = 2,
	ORE_IRON = 3,
	ORE_GOLD = 4,
	ORE_DIAMOND = 5,
	PIC_NOZDREV_1 = 6,
	PIC_NOZDREV_2 = 7,
	PIC_NOZDREV_3 = 8,
	PIC_NOZDREV_4 = 9
}

var item_name = {
	ID.EMPTY: "Пустота",
	ID.DIRT: "Земля",
	ID.STONE: "Камень",
	ID.ORE_COAL: "Угольная руда",
	ID.ORE_IRON: "Железная руда",
	ID.ORE_GOLD: "Золотая руда",
	ID.ORE_DIAMOND: "Алмазная руда",
	ID.PIC_NOZDREV_1: "Картина - Ноздрев(1)",
	ID.PIC_NOZDREV_2: "Картина - Ноздрев(2)",
	ID.PIC_NOZDREV_3: "Картина - Ноздрев(3)",
	ID.PIC_NOZDREV_4: "Картина - Ноздрев(4)"
}

var _meta := {}


func set_tile(x: int, y: int, id: int, meta := {}) -> void:
	set_cell(x, y, id)
	
	match id:
		ID.EMPTY, ID.DIRT, ID.STONE:
			_meta.erase(Vector2(x, y))
	
func get_title(x: int, y: int) -> Dictionary:
	return {
		id = get_cell(x, y),
		meta = _meta.get(Vector2(x, y))
	}

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	for upp in range(0, 64):
		for i in range(-20, 20):
			set_tile(i, upp, rng.randi_range(0, 5))
