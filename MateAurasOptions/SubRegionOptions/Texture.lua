if not MateAuras.IsLibsOK() then return end
---@type string
local AddonName = ...
---@class OptionsPrivate
local OptionsPrivate = select(2, ...)

local L = MateAuras.L;

local function createOptions(parentData, data, index, subIndex)
  local pointAnchors = {}
  local areaAnchors = {}
  for child in OptionsPrivate.Private.TraverseLeafsOrAura(parentData) do
    Mixin(pointAnchors, OptionsPrivate.Private.GetAnchorsForData(child, "point"))
    Mixin(areaAnchors, OptionsPrivate.Private.GetAnchorsForData(child, "area"))
  end

  local options = {
    __title = L["Texture %s"]:format(subIndex),
    __order = 1,
    textureVisible = {
      type = "toggle",
      width = MateAuras.doubleWidth,
      name = L["Show Texture"],
      order = 1,
    },
    textureTexture = {
      type = "input",
      width = MateAuras.doubleWidth - 0.15,
      name = L["Texture"],
      order = 2,
    },
    chooseTexture = {
      type = "execute",
      width = 0.15,
      name = L["Choose"],
      order = 2.1,
      func = function()
        local path = { "subRegions", index }
        local paths = {}
        for child in OptionsPrivate.Private.TraverseLeafsOrAura(parentData) do
          paths[child.id] = path
        end
        OptionsPrivate.OpenTexturePicker(parentData, paths, {
          texture = "textureTexture",
          color = "textureColor",
          mirror = "textureMirror",
          blendMode = "textureBlendMode"
        }, OptionsPrivate.Private.texture_types)
      end,
      imageWidth = 24,
      imageHeight = 24,
      control = "MateAurasIcon",
      image = "Interface\\AddOns\\MateAuras\\Media\\Textures\\browse",
    },
    textureColor = {
      type = "color",
      width = MateAuras.normalWidth,
      name = L["Color"],
      hasAlpha = true,
      order = 3
    },
    textureDesaturate = {
      type = "toggle",
      width = MateAuras.normalWidth,
      name = L["Desaturate"],
      order = 4,
    },
    textureBlendMode = {
      type = "select",
      width = MateAuras.normalWidth,
      name = L["Blend Mode"],
      order = 11,
      values = OptionsPrivate.Private.blend_types
    },
    textureMirror = {
      type = "toggle",
      width = MateAuras.normalWidth,
      name = L["Mirror"],
      order = 12
    },

    textureRotate = {
      type = "toggle",
      width = MateAuras.normalWidth,
      name = L["Allow Full Rotation"],
      order = 13,
      hidden = data and OptionsPrivate.Private.TextureBase.IsAtlas(data.texture)
    },
    textureRotation = {
      type = "range",
      control = "MateAurasSpinBox",
      width = MateAuras.normalWidth,
      name = L["Rotation"],
      min = 0,
      max = 360,
      step = 1,
      bigStep = 3,
      order = 14,
    },
  }

  OptionsPrivate.commonOptions.PositionOptionsForSubElement(data, options, 15, areaAnchors, pointAnchors)
  OptionsPrivate.AddUpDownDeleteDuplicate(options, parentData, index, "subtexture")

  return options
end

  MateAuras.RegisterSubRegionOptions("subtexture", createOptions, L["Shows a Texture"]);
