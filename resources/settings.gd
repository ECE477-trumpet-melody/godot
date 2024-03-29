class_name Settings extends Resource

@export_range(0, 1, .05) var music_volume: float = 1.0

func save():
	ResourceSaver.save(self, "res://resources/sets.tres")

static func loadIn():
	var res: Settings = load("res://resources/sets.tres") as Settings
	if !res:
		res = Settings.new()
	return res
