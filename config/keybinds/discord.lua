local bind = require("utils").bind
local comspace = "name:Comms"
local scomspace = "special:comms"

bind(SUPER .. ALTP .. "E", function()
	local dsp = require "dsp"

	-- is not special
	if not hl.get_workspace(scomspace) then
		hl.dispatch(dsp.win.move_all_win(comspace, scomspace, true))
	else -- is special
		hl.dispatch(dsp.win.move_all_win(scomspace, comspace, false))
		-- NOTE: Don't know why, but special:comms won't go away without
		-- 1 of these
		hl.dispatch(hl.dsp.workspace.toggle_special "comms")
	end
end)
