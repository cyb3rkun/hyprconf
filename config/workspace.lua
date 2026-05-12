-- Bind workspaces in groups of 3 to monitors
for i = 1, 9 do
	-- local monitor = i <= 3 and "desc:Dell Inc. DELL SE2425HG 17LTB84" or
	-- 	(i <= 6) and "desc:LG Electronics W2242 0x00039907" or
	-- 	(i <= 9) and "desc:Lenovo Group Limited 0x1144 VN-66718"
	local monitor = i <= 3 and "DP-1"
		or (i <= 6) and "HDMI-A-2"
		or (i <= 9) and "DP-2"
	-- Guard monitor just in case
	if not monitor then goto continue end
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = monitor,
		persistent = true,
	})
	::continue::
end

-- ┏━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Special Workspaces ┃
-- ┗━━━━━━━━━━━━━━━━━━━━┛
-- NOTE: special workspace for games
hl.workspace_rule({ workspace = "special:games", monitor = "DP-1" })

-- NOTE: special workspace for Forex (E.g MetaTrader)
hl.workspace_rule({
	workspace = "special:vtube",
	monitor = "HDMI-A-2",
})

-- NOTE: special workspace for Communication apps
hl.workspace_rule({ workspace = "name:Comms", monitor = "DP-2" })

---@param source string
---@param dest string
---@param follow boolean
local move = function(source, dest, follow)
	-- local dest_ws = hl.get_workspace(dest)
	local source_ws = hl.get_workspace(source)
	if not source_ws then
		hl.notification.create({
			timeout = 5000,
			text = "source does not exist",
			icon = "info",
		})
		return
	end

	local windows = source_ws:get_windows()
	hl.notification.create({
		timeout = 5000,
		text = "Following: " .. tostring(follow),
		icon = "info",
	})

	for key, window in pairs(windows) do
		hl.dispatch(hl.dsp.window.move({
			window = window,
			workspace = dest,
			follow = follow,
		}))
	end
	if source:find("special:") then
		local name = source:gsub("special:", "")
		hl.dispatch(hl.dsp.workspace.toggle_special(name))
	end
end
local comms_special = false
hl.bind(SUPER .. "+ALT+C", function()
	move(
		comms_special == false and "name:Comms" or "special:comms",
		comms_special == false and "special:comms" or "name:Comms",
		not comms_special
	)
	comms_special = not comms_special
end)
-- hl.bind(
-- 	SUPER .. "+ALT+C",
-- 	hl.dsp.window.move({ workspace = "name:Comms", follow = false})
-- )
hl.bind(
	SUPER .. "+ALT+SHIFT+C",
	hl.dsp.workspace.toggle_special("comms")
)

-- NOTE: special workspace for Launchers
-- (E.g Steam, Lutris, Heroic Games Launcher)
hl.workspace_rule({ workspace = "name:Laun", monitor = "DP-2" })
-- NOTE: special workspace for Forex (E.g MetaTrader)
hl.workspace_rule({ workspace = "name:ForX", monitor = "DP-2" })
