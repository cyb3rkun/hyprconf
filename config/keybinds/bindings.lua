-- ┏━━━━━━━━━━━━━━━━━━━┓
-- ┃ TERMINAL and QUIT ┃
-- ┗━━━━━━━━━━━━━━━━━━━┛
hl.bind(SUPER .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(SUPER .. "+Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(SUPER .. "+E", hl.dsp.exec_cmd(FileManager))

-- window float, fullscreen, togglesplit
hl.bind(SUPR .. "V", hl.dsp.window.float { action = "toggle" })
hl.bind(SUPR .. "F", hl.dsp.window.fullscreen { action = "toggle" })
hl.bind(SUPR .. SHFT .. "I", hl.dsp.layout "togglesplit") -- dwindle only

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Focus and Move with Window ID ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(SUPR .. key, hl.dsp.focus { workspace = i })
	hl.bind(
		SUPR .. SHFT .. key,
		hl.dsp.window.move { workspace = i }
	)
end

local directions = {
	["H"] = { "left", { x = -10, y = 0 } },
	["J"] = { "down", { x = 0, y = 10 } },
	["K"] = { "up", { x = 0, y = -10 } },
	["L"] = { "right", { x = 10, y = 0 } },
}

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Move and Focus Directionally ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
for key, direction in pairs(directions) do
	hl.bind(
		SUPER .. SHFTP .. key,
		hl.dsp.window.move { direction = direction[1] }
	)
	hl.bind(SUPR .. key, hl.dsp.focus { direction = direction[1] })
end

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Resize Submap ┃
-- ┗━━━━━━━━━━━━━━━┛
hl.bind(SUPR .. "R", hl.dsp.submap "resize")
hl.define_submap("resize", function()
	for key, direction in pairs(directions) do
		direction[2].relative = true
		hl.bind(
			key,
			hl.dsp.window.resize(direction[2]),
			{ repeating = true }
		)
	end
	hl.bind("escape", hl.dsp.submap "reset")
end)

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Mouse Navigation ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
-- Scroll through existing workspaces with SUPER .. scroll
hl.bind(SUPER .. "+mouse_down", hl.dsp.focus { workspace = "e+1" })
hl.bind(SUPER .. "+mouse_up", hl.dsp.focus { workspace = "e-1" })

-- Move/resize windows with SUPER .. LMB/RMB and dragging
hl.bind(SUPER .. "+mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(
	SUPER .. "+mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true }
)
