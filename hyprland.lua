package.cpath = os.getenv("HOME")
	.. "/.local/share/lux/?.so"
	.. ";"
	.. package.path
package.path = os.getenv("HOME")
	.. "/.local/share/lux/?.lua"
	.. ";"
	.. package.path
-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

require("vars.globals")
require("config.noctalia")

require("config.monitorconf")


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use

require("config.autostart")


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
require("config.env")

-----------------------
----- PERMISSIONS -----
-----------------------

require("config.permisions")


-----------------------
---- LOOK AND FEEL ----
-----------------------

require("config.general")

----------------
----  MISC  ----
----------------
require("config.hypr_misc")

---------------
---- INPUT ----
---------------

require("config.input")


---------------------
---- KEYBINDINGS ----
---------------------

require("config.keybinds")


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
require("config.window")
require("config.workspace")
