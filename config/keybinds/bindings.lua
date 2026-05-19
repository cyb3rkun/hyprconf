local utils = require "utils"
-- ┏━━━━━━━━━━━━━━━━━━━┓
-- ┃ TERMINAL and QUIT ┃
-- ┗━━━━━━━━━━━━━━━━━━━┛
local bind = utils.bind

bind(
	SUPER .. " + RETURN",
	hl.dsp.exec_cmd(TERM),
	{ desc = "Launch Terminal" }
)

bind(
	SUPER .. "+Q",
	hl.dsp.window.close(),
	{ desc = "Close Active Window" }
)
-- closeWindowBind:set_enabled(false)
bind(
	SUPER .. "+E",
	hl.dsp.exec_cmd(FileManager),
	{ desc = "Open File Manager" }
)

-- window float, fullscreen, togglesplit
bind(
	SUPR .. "V",
	hl.dsp.window.float { action = "toggle" },
	{ desc = "Toggle Float for Active Window" }
)
bind(SUPR .. "F", hl.dsp.window.fullscreen { action = "toggle" }, {
	desc = "Toggle Fullscreen",
})
bind(
	SUPR .. SHFT .. "I",
	hl.dsp.layout "togglesplit",
	{ desc = "Toggle split Horizontal/Vertical" }
) -- dwindle only
bind(SUPR .. SHFT .. "E", hl.dsp.exec_cmd "hyprlauncher")

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Focus and Move with Window ID ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(
		SUPR .. key,
		hl.dsp.focus { workspace = i },
		{ desc = "switch to workspace " .. i }
	)
	hl.bind(
		SUPR .. SHFT .. key,
		hl.dsp.window.move { workspace = i },
		{ desc = "Move Window to Worspace " .. i }
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
		hl.dsp.window.move { direction = direction[1] },
		{ desc = "move window " .. direction[1] }
	)
	hl.bind(
		SUPR .. key,
		hl.dsp.focus { direction = direction[1] },
		{ desc = "Move Focus " .. direction[1] }
	)
end

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Resize Submap ┃
-- ┗━━━━━━━━━━━━━━━┛
bind(
	SUPR .. "R",
	hl.dsp.submap "resize",
	{ desc = "Enter resize submap" }
)
hl.define_submap("resize", function()
	for key, direction in pairs(directions) do
		direction[2].relative = true
		bind(key, hl.dsp.window.resize(direction[2]), {
			repeating = true,
			desc = "Resize the window " .. direction[1],
		})
	end
	hl.bind("escape", require("utils").reset_submap)
end)

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Mouse Navigation ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
-- Scroll through existing workspaces with SUPER .. scroll
bind(
	SUPER .. "+mouse_down",
	hl.dsp.focus { workspace = "e+1" },
	{ desc = "Focuse Next workspace" }
)
bind(
	SUPER .. "+mouse_up",
	hl.dsp.focus { workspace = "e-1" },
	{ desc = "Focus Previous Workspace" }
)

-- Move/resize windows with SUPER .. LMB/RMB and dragging
bind(
	SUPER .. "+mouse:272",
	hl.dsp.window.drag(),
	{ mouse = true, desc = "Drag Window" }
)
bind(
	SUPER .. "+mouse:273",
	hl.dsp.window.resize(),
	{ mouse = true, desc = "Resize Window" }
)

-- ┏━━━━━━━━━━┓
-- ┃ Examples ┃
-- ┗━━━━━━━━━━┛
