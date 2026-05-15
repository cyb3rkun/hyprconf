local utils = require "utils"

---@param submap string
hl.on("keybinds.submap", function(submap)
	submap = submap:len() > 0 and submap or "reset"
	utils.notify("Submap: " .. submap, 3000, "info")
end)

-- Apply static tag "luancher" to steam
---@param win HL.Window
hl.on("window.open", function(win)
	if win.class:match "^[Ss]team$" then
		hl.dispatch(
			hl.dsp.window.tag { tag = "+launcher", window = win }
		)
	end
end)

---@param win HL.Window
-- WARN: Relies on config.window to set the dynamic game* tag
-- and the content_type to work.
hl.on("window.open", function(win)
	if win.content_type:match "game" then
		hl.exec_cmd(
			NoctaliaIpc .. "powerProfile enableNoctaliaPerformance"
		)
	end
end)

---@param win HL.Window
-- WARN: Relies on config.window to set the dynamic game* tag
-- and the content_type to work.
hl.on("window.close", function(win)
	---@type HL.Window[]
	local games = hl.get_windows { tag = "game*" }

	-- TEST: this will probably work most of the time.
	-- might have issues with multi-window *games*
	if #games > 1 then return end
	if win.content_type:match "game" then
		hl.exec_cmd(
			NoctaliaIpc .. "powerProfile disableNoctaliaPerformance"
		)
	end
end)
