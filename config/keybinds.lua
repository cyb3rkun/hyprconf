---------------------
---- KEYBINDINGS ----
---------------------

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
Str.enable_concat_plus()
hl.bind(
	SUPER + " + RETURN",
	hl.dsp.exec_cmd(Terminal),
	{ desc = "Launch Terminal" }
)
hl.bind(SUPER + "+Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(SUPER + " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(SUPER + "+E", hl.dsp.exec_cmd(FileManager))
hl.bind(SUPER + "+V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(SUPER + "+F", hl.dsp.window.fullscreen({ action = "toggle" }))
-- hl.bind(SUPER + " + R", hl.dsp.exec_cmd(Menu))
-- hl.bind(SUPER + " + P", hl.dsp.window.pseudo())
hl.bind(SUPER + "+I", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with SUPER + arrow keys
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(SUPER + "+" + key, hl.dsp.focus({ workspace = i }))
	hl.bind(
		SUPER + SFTPP + key,
		hl.dsp.window.move({ workspace = i })
	)
end

-- Move windows with SUPER-SHIFT + arrow keys
hl.bind(
	SUPER + SFTPP + "H",
	hl.dsp.window.move({ direction = "left" })
)
hl.bind(
	SUPER + "+SHIFT+L",
	hl.dsp.window.move({ direction = "right" })
)
hl.bind(SUPER + "+SHIFT+K", hl.dsp.window.move({ direction = "up" }))
hl.bind(
	SUPER + "+SHIFT+J",
	hl.dsp.window.move({ direction = "down" })
)
hl.bind(SUPER + "+H", hl.dsp.focus({ direction = "left" }))
hl.bind(SUPER + "+L", hl.dsp.focus({ direction = "right" }))
hl.bind(SUPER + "+K", hl.dsp.focus({ direction = "up" }))
hl.bind(SUPER + "+J", hl.dsp.focus({ direction = "down" }))

-- hl.define_submap("resize", function()
-- 	hl.bind(
-- 		"right",
-- 		hl.resize({ x = 10, y = 0, relative = true }),
-- 		{ repeating = true }
-- 	)
-- 	hl.bind(
-- 		"left",
-- 		hl.resize({ x = -10, y = 0, relative = true }),
-- 		{ repeating = true }
-- 	)
-- 	hl.bind(
-- 		"up",
-- 		hl.resize({ x = 0, y = 10, relative = true }),
-- 		{ repeating = true }
-- 	)
-- 	hl.bind(
-- 		"down",
-- 		hl.resize({ x = 10, y = -10, relative = true }),
-- 		{ repeating = true }
-- 	)
--
-- 	-- Use `reset` to go back to the global submap
-- 	hl.bind("escape", hl.dsp.submap("reset"))
-- end)

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]

-- Scroll through existing workspaces with SUPER + scroll
hl.bind(SUPER + "+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(SUPER + "+mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind(SUPER + "+mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(
	SUPER + "+mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true }
)
Str.disable_concat_plus()
