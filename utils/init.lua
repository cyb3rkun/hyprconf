local M = {}

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
