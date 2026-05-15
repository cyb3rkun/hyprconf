hl.bind(
	"PRINT",
	hl.dsp.exec_cmd "grimblast copysave area ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
hl.bind(
	CTL .. "PRINT",
	hl.dsp.exec_cmd "grimblast copysave active ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
hl.bind(
	ALT .. "print",
	hl.dsp.exec_cmd "grimblast copysave output ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png"
)
