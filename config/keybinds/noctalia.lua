-- local function exec_path(cmd)
-- 	return function() os.execute(cmd) end
-- end

--WARN: once noctalia updates, remove the file at /usr/local/bin/hyprctl

local ipc = "qs -c noctalia-shell ipc call "
local bind = require("utils").bind

bind(SUPR .. "D", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
bind(SUPR .. "S", hl.dsp.exec_cmd(ipc .. "controlCenter toggle"))
bind(SUPR .. "M", hl.dsp.exec_cmd(ipc .. "settings toggle"))
bind(SUPR .. "P", hl.dsp.exec_cmd(ipc .. "sessionMenu toggle"))
bind(
	SUPR .. ALT .. "K",
	hl.dsp.exec_cmd(ipc .. "plugin:keybind-cheatsheet toggle")
)

-- to restart noctalia use this command, or the keybind below
-- killall qs;qs -c noctalia-shell --no-duplicate >/dev/null 2>&1 & disown

bind(
	SUPR .. SHFT .. "N",
	hl.dsp.exec_cmd(
		"killall qs;"
			.. "qs -c noctalia-shell "
			.. "--no-duplicate "
			.. ">/dev/null 2>&1 "
	)
)

bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume increase"))
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"))
bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume muteOutput"))
bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(ipc .. "brightness increase")
)
bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(ipc .. "brightness decrease")
)
