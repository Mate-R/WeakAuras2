---@type string
local AddonName = ...
---@class Private
local Private = select(2, ...)

local L = MateAuras.L

local optionsVersion = "@project-version@"
--@debug@
optionsVersion = "Dev"
--@end-debug@

if optionsVersion ~= MateAuras.versionString then
  local message = string.format(L["The MateAuras Options Addon version %s doesn't match the MateAuras version %s. If you updated the addon while the game was running, try restarting World of Warcraft. Otherwise try reinstalling MateAuras"],
                    optionsVersion, MateAuras.versionString)
  ---@diagnostic disable-next-line: duplicate-set-field
  MateAuras.IsLibsOk = function() return false end
  ---@diagnostic disable-next-line: duplicate-set-field
  MateAuras.ToggleOptions = function()
       MateAuras.prettyPrint(message)
  end

end
