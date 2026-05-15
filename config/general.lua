-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config {
	general = {
		gaps_in = 1,
		gaps_out = 2,

		border_size = 1,

		col = {
			active_border = { colors = { CyBlue }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 1,
		rounding_power = 00,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.9696,
			xray = true,
		},
	},

	animations = {
		enabled = false,
	},
}

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config {
	dwindle = {
		preserve_split = true, -- You probably want this
	},
}

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config {
	master = {
		new_status = "master",
	},
}

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config {
	scrolling = {
		fullscreen_on_one_column = true,
	},
}
