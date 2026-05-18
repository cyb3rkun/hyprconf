-- ┏━━━━━━━━━━━┓
-- ┃ AUTOSTART ┃
-- ┗━━━━━━━━━━━┛

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd "qs -c noctalia-shell --no-duplicate"
	hl.exec_cmd "discord"
	hl.exec_cmd "nm-applet"
	hl.dispatch(hl.dsp.focus { workspace = 1 })
end)
