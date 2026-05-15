------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- For Random Monitors
hl.monitor {
	output = "",
	mode = "preferred",
	position = "auto",
	---@diagnostic disable-next-line: assign-type-mismatch
	scale = 1,
}
hl.monitor {
	output = "desc:Dell Inc. DELL SE2425HG 17LTB84",
	position = "0x0",
	mode = "1920x1080@200",
	---@diagnostic disable-next-line: assign-type-mismatch
	scale = 1,
	vrr = true,
	cm = "srgb",
}

hl.monitor {
	output = "desc:LG Electronics W2242 0x00039907",
	mode = "1680x1050",
	position = "auto-center-left",
	---@diagnostic disable-next-line: assign-type-mismatch
	scale = 1,
	transform = 3,
}
hl.monitor {
	output = "desc:Lenovo Group Limited 0x1144 VN-66718",
	position = "auto-center-right",
	mode = "1920x1200",
	---@diagnostic disable-next-line: assign-type-mismatch
	scale = 1,
}
