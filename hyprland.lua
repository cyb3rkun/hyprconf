-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Global Variables ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
require "vars.globals"
require "vars.colors"

-- ┏━━━━━━━━━━━━━━━━┓
-- ┃ Monitor Config ┃
-- ┗━━━━━━━━━━━━━━━━┛
require "config.monitorconf"

-- ┏━━━━━━━━━━━┓
-- ┃ AUTOSTART ┃
-- ┗━━━━━━━━━━━┛
require "config.autostart"

-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ ENVIRONMENT VARIABLES ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
require "config.env"

-- ┏━━━━━━━━━━━━━┓
-- ┃ PERMISSIONS ┃
-- ┗━━━━━━━━━━━━━┛
require "config.permisions"

-- ┏━━━━━━━━━━━━━━━┓
-- ┃ Look and Feel ┃
-- ┗━━━━━━━━━━━━━━━┛
require "config.general"

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Mscelaneous Hyprland Settings ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require "config.hypr_misc"

-- ┏━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Input Configuration ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━┛
require "config.input"

-- ┏━━━━━━━━━━━━━┓
-- ┃ Keybindings ┃
-- ┗━━━━━━━━━━━━━┛
require "config.keybinds.bindings"
require "config.keybinds.obs"
require "config.keybinds.discord"
require "config.keybinds.warudo"
require "config.keybinds.noctalia"
require "config.keybinds.winspace"
require "config.keybinds.cmds"

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Window and Workspace Rules ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require "config.window"
require("config.windows.noctalia")
require "config.workspace"

-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ Event Listeners ┃
-- ┗━━━━━━━━━━━━━━━━━┛
require "event_listeners"
