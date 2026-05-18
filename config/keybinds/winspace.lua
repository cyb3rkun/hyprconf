-- shift: move
-- ctrl: focus
-- alt: toggle
local toggle_leader = SUPER .. ALTP
local focus_leader = SUPER .. CTLP
local move_leader = SUPER .. SHFTP
local bind = require("utils").bind

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
	hl.bind(
		focus_leader .. key,
		hl.dsp.focus { workspace = "name:" .. name }
	)
	hl.bind(
		move_leader .. key,
		hl.dsp.window.move { workspace = "name:" .. name }
	)
end
-- ┏━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Peek Workspace By ID ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━┛
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	bind(SUPR .. CTL .. key, function()
		local w = hl.get_workspace(tostring(i))
		local peek_name = "special:peak-" .. tostring(key)

		-- Hide if not hidden
		if not hl.get_workspace(peek_name) then
			hl.dispatch(
				require("dsp").win.move_all_win(i, peek_name, true)
			)
		else -- Restore if hidden
			hl.dispatch(
				require("dsp").win.move_all_win(peek_name, i, false)
			)
			hl.dispatch(hl.dsp.workspace.toggle_special(peek_name))
			hl.dispatch(hl.dsp.workspace.toggle_special(peek_name))
		end
	end, { desc = "Peek Workspace" .. key })
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Hide All Windows on active workspace ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
bind(SUPER .. ALTP .. "H", function()
	local acw = hl.get_active_workspace()
	if not acw then return end
	local hidden_name = "special:hidden-" .. acw.config_name

	-- Hide if not hidden
	if not hl.get_workspace(hidden_name) then
		hl.dispatch(
			require("dsp").win.move_all_win(
				acw.config_name,
				hidden_name,
				false
			)
		)
	else -- Restore if hidden
		hl.dispatch(
			require("dsp").win.move_all_win(
				hidden_name,
				acw.config_name,
				true
			)
		)
	end
end)
