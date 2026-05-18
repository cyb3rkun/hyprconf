---@class Utils
local Utils = {}

-- -@param text string # The Text the user wants to send.
-- -@param timeout number # The time in MS that the notification will last
-- -@param icon nil | "info" | "warning" | "error" #
---@param t HL.NotificationOptions
-- The Icon or mode of the warning
function Utils.notify(t)
	hl.notification.create {
		text = t.text or "NOTEXT!!!!!!!!!!!",
		timeout = t.timeout,
		icon = t.icon,
	}
end

---@param keys string
---@param dispatcher HL.Dispatcher | function
---@param opts HL.BindOptions?
---@return HL.Keybind
function Utils.bind(keys, dispatcher, opts)
	local b = hl.bind(keys, dispatcher, opts)

	local x = {}
	for _, existing in ipairs(BINDS) do
		if
			existing.display_key == b.display_key
			and existing.submap == b.submap
			and existing.release == b.release
		then
			local msg = string.format(
				"conflicting keybinds \n\t%s\n\t%s\n\t%s\n\t%s",
				existing.display_key,
				existing.desc,
				b.display_key,
				b.description
			)
			Utils.notify {
				text = msg,
				timeout = 2000,
				icon = "warning",
			}
		end
	end
	table.insert(BINDS, {
		display_key = b.display_key,
		desc = b.description,
		arg = b.arg,
		devices = b.devices,
		device_inclusive = b.device_inclusive,
		drag = b.drag,
		enabled = b.enabled,
		submap = b.submap,
		submap_universal = b.submap_universal,
		release = b.release,
	})
	return b
end

Utils.binds = function()
	Utils.notify {
		text = require("lux").inspect(BINDS),
		timeout = 9000,
		icon = "info",
	}
	print(require("lux").inspect(BINDS))
end

function Utils.reset_submap() hl.dispatch(hl.dsp.submap "reset") end

return Utils
