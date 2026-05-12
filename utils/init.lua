local M = {}

---@param source string
---@param dest string
---@param follow boolean
M.move = function(source, dest, follow)
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
end

return M
