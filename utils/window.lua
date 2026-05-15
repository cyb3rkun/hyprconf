local M = {}

---@param source string
---@param dest string
---@param follow boolean
function M.move_all_win(source, dest, follow)
	-- local dest_ws = hl.get_workspace(dest)
	local source_ws = hl.get_workspace(source)
	if not source_ws then
		hl.notification.create {
			timeout = 5000,
			text = "source does not exist",
			icon = "info",
		}
		return
	end

	local windows = source_ws:get_windows()

	for _, window in ipairs(windows) do
		hl.dispatch(hl.dsp.window.move {
			window = window,
			workspace = dest,
			follow = follow,
		})
	end

	if source:find "special:" then
		local name = source:gsub("special:", "")
		hl.dispatch(hl.dsp.workspace.toggle_special(name))
	end
end
return M
