package.cpath = os.getenv "HOME"
	.. "/.local/share/lux/?.so"
	.. ";"
	.. package.path
package.path = os.getenv "HOME"
	.. "/.local/share/lux/?.lua"
	.. ";"
	.. package.path

local lux = require "lux"

---@type {["opts"]:GlobalOpts, ["libs"]:PkgList}
local cfg = {
	opts = {
		scope = "local",
	},
	libs = {
		{ "cyb3rkun/lua-overloads" },
		{ "cyb3rkun/lua-json" },
		{ "cyb3rkun/lua-test" },
	},
}

lux.install_async(cfg.libs, cfg.opts)
