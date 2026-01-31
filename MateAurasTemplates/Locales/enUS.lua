if not MateAuras.IsLibsOK() then return end

local L = MateAuras.L

--@localization(locale="enUS", format="lua_additive_table", namespace="MateAuras / Templates")@

-- Make missing translations available
setmetatable(MateAuras.L, {__index = function(self, key)
  self[key] = (key or "")
  return key
end})
