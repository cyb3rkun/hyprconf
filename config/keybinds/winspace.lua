-- shift: move
-- ctrl: focus
-- alt: toggle
local toggle_leader = SUPER .. ALTP
local focus = SUPER .. CTLP
local move_leader = SUPER .. SHFTP

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Special Workspace bindings ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local special_workspaces = {
	["X"] = "games",
	["V"] = "vtube",
	["O"] = "obs",
	["T"] = "otd",
	["C"] = "comms",
}

for key, name in pairs(special_workspaces) do
	hl.bind(
		toggle_leader .. key,
		hl.dsp.workspace.toggle_special(name)
	)
	hl.bind(
		move_leader .. key,
		hl.dsp.window.move { workspace = "special:" .. name }
	)
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Named Workspace bindings ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local named_workspaces = {
	["D"] = "Comms",
	["S"] = "Laun",
	["F"] = "ForX",
}

for key, name in pairs(named_workspaces) do
	hl.bind(focus .. key, hl.dsp.focus { workspace = "name:" .. name })
	hl.bind(
		move_leader .. key,
		hl.dsp.window.move { workspace = "name:" .. name }
	)
end

-- special binding for discord
local comms_special = false
hl.bind(SUPER .. ALTP .. "E", function()
	require("utils.window").move_all_win(
		comms_special == false and "name:Comms" or "special:comms",
		comms_special == false and "special:comms" or "name:Comms",
		not comms_special
	)
	comms_special = not comms_special
end)

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Hide All Windows on active workspace ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
local ow
local is_hidden = false
hl.bind(SUPER .. ALTP .. "H", function()
	local u = require "utils"
	if not is_hidden then
		ow = hl.get_active_workspace()
		if not ow then
			hl.notification.create {
				timeout = 2000,
				text = "Source Workspace does not exit",
				icon = "debug",
			}
			return
		end
		u.move_all_win(ow.name, "special:hidden", false)
		is_hidden = true
	else
		u.move_all_win("special:hidden", ow.name, true)
		hl.dispatch(hl.dsp.workspace.toggle_special "hidden")
		is_hidden = false
		ow = nil
	end
end)
