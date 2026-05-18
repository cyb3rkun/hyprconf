-- KEYS
SUPER = "SUPER"
SUPR = "SUPER+"
ALT = "ALT+"
ALTP = "+ALT+"
CTL = "CTRL+"
CTLP = "+CTRL+"
SHFT = "SHIFT+"
SHFTP = "+SHIFT+"

TERM = "wezterm"
FileManager = "dolphin"
NoctaliaIpc = "qs -c noctalia-shell ipc call "

-- { display_key: string,
-- 	{
-- 		desc: any (prob string),
-- 		arg : string,
-- 		devices: any,
-- 		device_inclusive: boolean,
-- 		drag = boolean,
-- 		enabled = boolean,
-- 	},
-- }

---@alias Binding {
---display_key: string,
---desc: any,
---arg: string,
---devices: any,
---device_inclusive: boolean,
---drag: boolean,
---enabled: boolean,
---submap: string,
---submap_universal: string,
---release: boolean}

---@type Binding[]
BINDS = {}
-- TODO: add submap tracking
Notify = require("utils").notify
-- I use Noctalia, so no need for custom menu
-- Menu = "hyprlauncher"
