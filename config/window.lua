-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Communication Apps ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
Str.enable_concat_plus()
hl.window_rule({
	name = "Comms",
	match = {
		class = "(.*[Dd]iscord.*|.*[Ss]ignal.*|.*[Ee]lement.*)",
	},
	workspace = "name:Comms",
})
hl.bind(
	SUPER + "+ALT+SHIFT+D",
	hl.dsp.window.move({ workspace = "name:Comms" })
)
hl.bind(SUPER + "+ALT+D", hl.dsp.focus({ workspace = "name:Comms" }))

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Game Launchers ┃
-- ┗━━━━━━━━━━━━━━━━┛
hl.window_rule({
	name = "Launchers",
	match = { class = "(.*[Ss]team.*)" },
	workspace = "name:Laun",
})
hl.bind(SUPER + "+ALT+L", hl.dsp.focus({ workspace = "name:Laun" }))

-- ┏━━━━━━━━━━━━━━┓
-- ┃ Game Windows ┃
-- ┗━━━━━━━━━━━━━━┛
hl.window_rule({
	name = "Games",
	match = { initial_class = "(^steam_app_.*)" },
	workspace = "special:games",
})
hl.bind(
	SUPER + "+ALT+SHIFT+X",
	hl.dsp.window.move({ workspace = "special:games" })
)
hl.bind(SUPER + "+ALT+X", hl.dsp.workspace.toggle_special("games"))

-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ Vtubing Windows ┃
-- ┗━━━━━━━━━━━━━━━━━┛
hl.window_rule({
	name = "Vtubing",
	match = { initial_class = "(^steam_app_2079120)" },
	workspace = "special:vtube",
})
hl.bind(
	SUPER + "+ALT+SHIFT+V",
	hl.dsp.window.move({ workspace = "special:vtube" })
)
hl.bind(SUPER + "+ALT+V", hl.dsp.workspace.toggle_special("vtube"))

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Forex Trading ┃
-- ┗━━━━━━━━━━━━━━━┛
hl.window_rule({
	name = "ForX",
	match = { class = "(.*[Mm]eta[Tt]rader.*)" },
	workspace = "name:ForX",
})
hl.bind(SUPER + "+ALT+F", hl.dsp.focus({ workspace = "name:ForX" }))

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ OpenTabletDriver ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
hl.window_rule({
	name = "OpenTabletDriver",
	match = { class = "(.*[Oo]pen[Tt]ablet[Dd]river.*)" },
	workspace = "name:otd",
})
hl.bind(SUPER + "+ALT+T", hl.dsp.workspace.toggle_special("otd"))
Str.disable_concat_plus()
