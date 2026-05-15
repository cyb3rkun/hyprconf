local win = require "utils.window"
---@param submap string
hl.on("keybinds.submap", function(submap)
	submap = submap:len() > 0 and submap or "reset"
	win.notify("Submap: " .. submap, 3000, "info")
end)
