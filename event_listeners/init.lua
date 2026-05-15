local utils = require "utils"

---@param submap string
hl.on("keybinds.submap", function(submap)
	submap = submap:len() > 0 and submap or "reset"
	utils.notify("Submap: " .. submap, 3000, "info")
end)

-- Apply static tag "luancher" to steam
---@param win HL.Window
hl.on("window.open", function(win)
	if win.class:match "[Ss]team" then
		hl.dispatch(
			hl.dsp.window.tag { tag = "+launcher", window = win }
		)
	end
end)

-- TODO:
-- Create listener to listen for games, and send noctalia ipc call to
-- enable Noctalia performance mode when a game launches
