-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Communication Apps ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
hl.window_rule {
	name = "Comms",
	match = {
		class = "(.*[Dd]iscord.*|.*[Ss]ignal.*|.*[Ee]lement.*)",
	},
	workspace = "name:Comms",
}

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Game Launchers ┃
-- ┗━━━━━━━━━━━━━━━━┛
hl.window_rule {
	name = "Launchers",
	match = { class = "[Ss]team" },
	workspace = "name:Laun silent",
	render_unfocused = true,
	no_blur = true,
	no_dim = true,
	no_shadow = true,
}

-- ┏━━━━━━━━━━━━━━┓
-- ┃ Game Windows ┃
-- ┗━━━━━━━━━━━━━━┛
hl.window_rule {
	match = { initial_class = "steam_app_\\d+" },
	content = "game",
}

hl.window_rule {
	name = "Games",
	match = { initial_class = "steam_app_\\d+", content = "game" },
	workspace = "special:games",
	render_unfocused = true,
	no_blur = true,
	no_dim = true,
	no_shadow = true,
	opaque = true,
	content = "game",
	immediate = true,
	no_anim = true,
}

-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ Vtubing Windows ┃
-- ┗━━━━━━━━━━━━━━━━━┛
hl.window_rule {
	name = "Vtubing",
	match = { initial_class = "steam_app_(2079120)" },
	workspace = "special:vtube",
}

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Forex Trading ┃
-- ┗━━━━━━━━━━━━━━━┛
hl.window_rule {
	name = "ForX",
	match = { class = "[Mm]eta\\s*[Tt]rader" },
	workspace = "name:ForX",
}

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ OpenTabletDriver ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
hl.window_rule {
	name = "OpenTabletDriver",
	match = { class = "(.*[Oo]pen[Tt]ablet[Dd]river.*)" },
	workspace = "name:otd",
}
