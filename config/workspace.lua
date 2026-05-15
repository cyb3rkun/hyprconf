-- Bind workspaces in groups of 3 to monitors
for i = 1, 9 do
	local monitor = i <= 3 and "desc:Dell Inc. DELL SE2425HG 17LTB84"
		or (i <= 6) and "desc:LG Electronics W2242 0x00039907"
		or (i <= 9) and "desc:Lenovo Group Limited 0x1144 VN-66718"

	-- Guard monitor just in case
	if not monitor then goto continue end
	hl.workspace_rule {
		workspace = tostring(i),
		monitor = monitor,
		persistent = true,
	}
	::continue::
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Special & Named Workspaces ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
---@type HL.WorkspaceRuleSpec[]
local wspace_l = {
	{ workspace = "special:games", monitor = "DP-1" },
	{ workspace = "special:vtube", monitor = "HDMI-A-2" },
	{ workspace = "name:Comms", monitor = "DP-2" },
	{ workspace = "name:Laun", monitor = "DP-2" },
	{ workspace = "name:ForX", monitor = "DP-2" },
}

for _, w in ipairs(wspace_l) do
	hl.workspace_rule(w)
end
