-- local function exec_path(cmd)
-- 	return function() os.execute(cmd) end
-- end

--WARN: once noctalia updates, remove the file at /usr/local/bin/hyprctl

local ipc = "qs -c noctalia-shell ipc call "

Str.enable_concat_plus()

hl.bind(SUPER + "+D", hl.dsp.exec_cmd(ipc + "launcher toggle"))
-- hl.bind(SUPER + "+D", exec_path(ipc + "launcher toggle"))
hl.bind(SUPER + "+S", hl.dsp.exec_cmd(ipc + "controlCenter toggle"))
hl.bind(SUPER + "+M", hl.dsp.exec_cmd(ipc + "settings toggle"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc + "volume increase"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc + "volume decrease"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc + "volume muteOutput"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc + "brightness increase"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc + "brightness decrease"))
Str.disable_concat_plus()
