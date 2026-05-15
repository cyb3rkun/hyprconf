local M = {}

---@param text string # The Text the user wants to send.
---@param timeout number # The time in MS that the notification will last
---@param icon nil | "info" | "warning" | "error" # 
-- The Icon or mode of the warning
function M.notify(text, timeout, icon)
	hl.notification.create {
		text = text,
		timeout = timeout,
		icon = icon,
	}
end

function M.reset_submap()
	return function() hl.dispatch(hl.dsp.submap "reset") end
end

return M
