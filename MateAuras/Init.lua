---@type string
local AddonName = ...
---@class Private
local Private = select(2, ...)
WASYNC_MAIN_PRIVATE = Private

---@class MateAuras
MateAuras = {}
---@type table<string, string>
MateAuras.L = {}
Private.frames = {}

--- @alias uid string
--- @alias auraId string

--- @class state
--- @field id auraId
--- @field cloneId string?
--- @field show boolean?
--- @field changed boolean?
--- @field paused boolean?
--- @field remaining number?
--- @field autoHide boolean|string|nil
--- @field progressType "timed"|"static"|nil
--- @field expirationTime number?
--- @field duration number?
--- @field name any?
--- @field icon any?
--- @field value number?
--- @field total number?
--- @field inverse boolean?

--- @alias non_transmissable_field table<string, non_transmissable_field|boolean>

--- @class multiUnitUnits
--- @field nameplate table<string, boolean>
--- @field boss table<string, boolean>
--- @field arena table<string, boolean>
--- @field group table<string, boolean>
--- @field party table<string, boolean>
--- @field raid table<string, boolean>

--- @alias traverseFunction fun(): auraData

---@class WARegion : Frame
---@field state state
---@field states state[]
---@field regionType string
---@field FrameTick fun(self: WARegion)?
---@field UpdateValue fun(self: WARegion)?
---@field UpdateTime fun(self: WARegion)?
---@field Update fun(self: WARegion)?

--- @class Private
--- @field ActivateAuraEnvironment fun(id: auraId?, cloneId: string?, state: state?, states: state[]?, config: boolean?)
--- @field ActivateAuraEnvironmentForRegion fun(region: table, onlyConfig: boolean?)
--- @field AddToWatchedTriggerDelay fun(id: auraId, triggerNum: number)
--- @field anchor_frame_types table<anchorFrameTypes, string>
--- @field anchor_frame_types_group table<anchorFrameTypes, string>
--- @field anim_function_strings table<string, string>
--- @field anim_presets table<string, table>
--- @field AuraWarnings AuraWarnings
--- @field AuraEnvironmentWrappedSystem AuraEnvironmentWrappedSystem
--- @field callbacks callbacks
--- @field category_event_prototype table<string, table<string, string>>
--- @field CanHaveTooltip fun(data: auraData): boolean
--- @field CheckTalentsForLoad fun(event: string)
--- @field ContainsCustomPlaceHolder fun(input: string): boolean
--- @field ContainsAnyPlaceHolders fun(input: string): boolean
--- @field ContainsPlaceHolders fun(input: string, placeholders: string, checkDoublePercent?: boolean): boolean
--- @field CreateSubscribableObject fun(): SubscribableObject
--- @field clones table<auraId, table<string, table>>
--- @field customActionsFunctions table<auraId, table<string, function?>>
--- @field DebugLog debugLog
--- @field dynamic_texts table<string, table>
--- @field EndEvent fun(state: state): boolean?
--- @field EnsureRegion fun(id: auraId, cloneId: string?): WARegion
--- @field ExecEnv table
--- @field event_prototypes table<string, prototypeData>
--- @field event_categories table<string, {name: string, default: string }>
--- @field Features Features
--- @field FindUnusedId fun(prefix: string?): string
--- @field FixGroupChildrenOrderForGroup fun(data: auraData)
--- @field frames table<string, table>
--- @field function_strings table<string, string>
--- @field GetDataByUID fun(uid: uid): auraData
--- @field GetErrorHandlerId fun(id: auraId, context: string): function
--- @field GetErrorHandlerUid fun(uid: uid, context: string): function
--- @field GetRegionByUID fun(uid: uid, cloneId: string): Region
--- @field glow_types table<string, string>
--- @field inverse_point_types table<string, string>
--- @field IsCLEUSubevent fun(subevent: string): boolean
--- @field IsDragonriding fun(): boolean
--- @field IsGroupType fun(data: auraData): boolean
--- @field item_slot_types string[]
--- @field LibSpecWrapper LibSpecWrapper
--- @field linked table<auraId, number>
--- @field loaded table<auraId, boolean>
--- @field LoadFunction fun(input: string): function
--- @field LoadOptions fun(msg: string?): boolean
--- @field maxTimerDuration number
--- @field multiUnitUnits multiUnitUnits
--- @field non_transmissable_fields table<string, non_transmissable_field>
--- @field non_transmissable_fields_v2000 table<string, non_transmissable_field>
--- @field orientation_types table<string, string>
--- @field orientation_with_circle_types table<string, string>
--- @field ParseNumber fun (numString: string|number): number?, string?
--- @field PreShowModels fun()
--- @field PrintHelp fun()
--- @field QuotedString fun(input: string): string
--- @field regionOptions table<string, table>
--- @field regions table<auraId, table>
--- @field regionTypes table<string, table>
--- @field reset_ranged_swing_spells table<number, boolean>
--- @field reset_swing_spells table<number, boolean>
--- @field noreset_swing_spells table<number, boolean>
--- @field RunCustomTextFunc fun(region: table, f: function): string?
--- @field spark_rotation_types table<string, string>
--- @field spec_types string[]
--- @field spec_types_3 string[]
--- @field spec_types_2 string[]
--- @field StartProfileAura fun(id: auraId)
--- @field StartProfileSystem fun(system: string)
--- @field StopProfileAura fun(id: auraId)
--- @field StopProfileSystem fun(system: string)
--- @field subRegionOptions table<string, table>
--- @field subRegionTypes table<string, table>
--- @field tick_placement_modes table<string, string>
--- @field tinySecondFormat fun(value: string|number): string?
--- @field TraverseAll fun(data: auraData): traverseFunction, auraData
--- @field TraverseAllChildren fun(data: auraData): traverseFunction, auraData
--- @field TraverseGroups fun(data: auraData): traverseFunction, auraData
--- @field TraverseLeafs fun(data: auraData): traverseFunction, auraData
--- @field TraverseLeafsOrAura fun(data: auraData): traverseFunction, auraData
--- @field TraverseParents fun(data: auraData): traverseFunction, auraData
--- @field TraverseSubGroups fun(data: auraData): traverseFunction, auraData
--- @field triggerTypes table<string, table>
--- @field triggerTypesOptions table<string, any>
--- @field UIDtoID fun(uid: uid): auraId
--- @field UnitEventList table<string, boolean>
--- @field UnitPlayerControlledFixed fun(unit: string): boolean
--- @field UpdatedTriggerState fun(id: auraId)
--- @field validate fun(input: table, default:table)
--- @field watched_trigger_events table<auraId, table<integer, table<integer, boolean>>>
--- @field RegisterRegionType fun(regionType: string, createFunction: function, modifyFunction: function, defaults: table, properties: table|function|nil, validate: function?))

--- @alias triggerTypes
--- | "aura"
--- | "aura2"
--- | "custom"

--- @alias anchorFrameTypes
--- | "SCREEN"
--- | "PRD"
--- | "MOUSE"
--- | "SELECTFRAME"
--- | "NAMEPLATE"
--- | "UNITFRAME"
--- | "CUSTOM"

--- @class triggerData
--- @field buffShowOn string
--- @field debuffType string
--- @field essence number?
--- @field event string|nil
--- @field instance_size table|nil
--- @field itemName string?
--- @field itemSetName string?
--- @field itemTypeName table|nil
--- @field range number?l
--- @field realSpellName string?
--- @field rune number?
--- @field spellName string?
--- @field subeventPrefix string?
--- @field subeventSuffix string?
--- @field type triggerTypes
--- @field unit string?
--- @field use_alwaystrue boolean|nil
--- @field use_ignoreoverride boolean|nil
--- @field use_showOn boolean|nil

---@class prototypeDataArgs
---@field name string
---@field required boolean?
---@field display string
---@field type "unit"|nil
---@field init "string"|nil
---@field values any
---@field desc string?
---@field store boolean?
---@field test string?

---@class prototypeData
---@field durationFunc (fun(trigger: triggerData): number, number, boolean?)|nil
---@field init (fun(trigger: triggerData):string?)|nil
---@field useModRate boolean?
---@field timedrequired boolean?
---@field GetNameAndIcon (fun(trigger: triggerData): string?, string?)|nil
---@field iconFunc (fun(trigger: triggerData): string?)|nil
---@field loadFunc (fun(trigger: triggerData): nil)|nil
---@field nameFunc (fun(trigger: triggerData): string?)|nil
---@field events (fun(trigger: triggerData): table)|nil
---@field internal_events (fun(trigger: triggerData): table)|nil
---@field name string
---@field statesParameter "unit"|"one"|"all"|nil
---@field progressType "timed"|"static"|"none"

--- @class triggerUntriggerData
--- @field trigger triggerData
--- @field untrigger triggerData

--- @class conditionCheck
--- @field variable string
--- @field trigger number
--- @field checks conditionCheck[]|nil

--- @class conditionChanges
--- @field property string

--- @class conditionData
--- @field check conditionCheck
--- @field changes conditionChanges

--- @class subRegionData

--- @class actionData
--- @field do_glow boolean
--- @field do_message boolean
--- @field do_sound boolean
--- @field message string
--- @field message_type string


--- @class actions
--- @field start actionData
--- @field finish actionData

--- @class load
--- @field use_realm boolean
--- @field itemtypeequipped table
--- @field size table

--- @alias regionTypes
--- | "aurabar"
--- | "dynamicgroup"
--- | "fallback"
--- | "group"
--- | "icon"
--- | "model"
--- | "progresstexture"
--- | "stopmotion"
--- | "text"
--- | "texture"

--- @class information
--- @field forceEvents boolean|nil
--- @field ignoreOptionsEventErrors boolean|nil
--- @field groupOffset boolean|nil

--- @alias dynamicGroupCenterType
--- | "LR"
--- | "RL"
--- | "CLR"
--- | "CRL"

--- @alias dynamicGroupGridType
--- | "RU"
--- | "UR"
--- | "LU"
--- | "UL"
--- | "RD"
--- | "DR"
--- | "LD"
--- | "DL"
--- | "HD"
--- | "HU"
--- | "VR"
--- | "VL"
--- | "DH"
--- | "UH"
--- | "LV"
--- | "RV"
--- | "HV"
--- | "VH"

--- @alias dynamicGroupCircularTypes
--- | "RADIUS"
--- | "SPACING"

--- @alias ColorArray {[1]: number, [2]: number, [3]: number, [4]: number }

--- @class auraData
--- @field anchorFrameType anchorFrameTypes?
--- @field animate boolean?
--- @field arcLength number?
--- @field actions actions?
--- @field border boolean?
--- @field borderBackdrop string?
--- @field borderColor ColorArray?
--- @field borderEdge string?
--- @field borderOffset number?
--- @field borderInset number?
--- @field borderSize number?
--- @field centerType dynamicGroupCenterType?
--- @field conditions conditionData[]?
--- @field constantFactor dynamicGroupCircularTypes
--- @field controlledChildren auraId[]?
--- @field displayText string?
--- @field frameStrata number?
--- @field fullCircle boolean?
--- @field gridType dynamicGroupGridType?
--- @field gridWidth number?
--- @field rowSpace number?
--- @field columnSpace number?
--- @field grow string?
--- @field id auraId
--- @field internalVersion number
--- @field information information
--- @field load load
--- @field limit number?
--- @field orientation string?
--- @field parent auraId?
--- @field radius number?
--- @field rotation number?
--- @field regionType regionTypes
--- @field scale number?
--- @field selfPoint AnchorPoint
--- @field subRegions subRegionData?
--- @field triggers triggerUntriggerData[]
--- @field url string?
--- @field useLimit boolean?
--- @field xOffset number?
--- @field yOffset number?

--- @class LibCustomGlow-1.0
--- @field ButtonGlow_Start fun(frame: Frame)
--- @field ButtonGlow_Stop fun(frame: Frame)
--- @field AutoCastGlow_Start fun(frame: Frame)
--- @field AutoCastGlow_Stop fun(frame: Frame)
--- @field PixelGlow_Start fun(frame: Frame)
--- @field PixelGlow_Stop fun(frame: Frame)

--- @class LibGetFrame-1.0
--- @field GetUnitFrame fun(unit: string)
--- @field GetUnitNameplate fun(unit: string)
--- @field StartProfile fun()
--- @field StopProfile fun()
--- @field GetProfileData fun(): table

--- @class LibSerialize
--- @field SerializeEx fun(self: LibSerialize,options: table, input: any)
--- @field Deserialize fun(self: LibSerialize, input: string): table

--- @class LibDeflate
--- @field CompressDeflate fun(self: LibDeflate, input: string, options: table): string
--- @field EncodeForPrint fun(self: LibDeflate, input: string): string)
--- @field EncodeForWoWAddonChannel fun(self: LibDeflate, input: string): string
--- @field DecodeForPrint fun(self: LibDeflate, input: string): string
--- @field DecodeForWoWAddonChannel fun(self: LibDeflate, input: string): string
--- @field DecompressDeflate fun(self: LibDeflate, input: string): string

--- @class LibDBIcon-1.0
--- @field Hide fun(self: LibDBIcon-1.0, name: string)
--- @field Register fun(self: LibDBIcon-1.0, name: string, broker: table, options: table)
--- @field Show fun(self: LibDBIcon-1.0, name: string)

--- @class LibSharedMedia-3.0
--- @field Fetch fun(self: LibSharedMedia-3.0, mediaType: string, name: string)
--- @field HashTable fun(self: LibSharedMedia-3.0, mediaType: string): table<string, string>
--- @field Register fun(self: LibSharedMedia-3.0, mediaType: string, name: string, path: string|number, flags: number?)
--- @field RegisterCallback fun(self: LibSharedMedia-3.0, callbackType: string, callback: fun(_: any, mediaType: string, key: string))
--- @field LOCALE_BIT_western number
--- @field LOCALE_BIT_ruRU number

--- @class LibCompress
--- @field Decompress fun(self: LibCompress, input: string): string

--- @class AceTimer-3.0
--- @field Embed fun(self: AceTimer-3.0, t: table)

MateAuras.normalWidth = 1.3
MateAuras.halfWidth = MateAuras.normalWidth / 2
MateAuras.doubleWidth = MateAuras.normalWidth * 2
local versionStringFromToc = C_AddOns.GetAddOnMetadata("MateAuras", "Version")
local versionString = "@project-version@"
local buildTime = "@build-time@"

local flavorFromToc = C_AddOns.GetAddOnMetadata("MateAuras", "X-Flavor")
local flavorFromTocToNumber = {
  Vanilla = 1,
  TBC = 2,
  Wrath = 3,
  Cata = 4,
  Mists = 5,
  Mainline = 10
}
local flavor = flavorFromTocToNumber[flavorFromToc]

if not versionString:find("beta", 1, true) then
  MateAuras.buildType = "release"
else
  MateAuras.buildType = "beta"
end

--@alpha@
MateAuras.buildType = "alpha"
--@end-alpha@

--@experimental@
MateAuras.buildType = "pr"
--@end-experimental@

--@debug@
if versionStringFromToc == "@project-version@" then
  versionStringFromToc = "Dev"
  buildTime = "Dev"
  MateAuras.buildType = "dev"
end
--@end-debug@

MateAuras.versionString = versionStringFromToc
MateAuras.buildTime = buildTime
MateAuras.newFeatureString = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0|t"
MateAuras.BuildInfo = select(4, GetBuildInfo())

---@return boolean result
function MateAuras.IsClassicEra()
  return flavor == 1
end
-- save compatibility with old auras
MateAuras.IsClassic = MateAuras.IsClassicEra

---@return boolean result
function MateAuras.IsWrathClassic()
  return flavor == 3
end

---@return boolean result
function MateAuras.IsCataClassic()
  return flavor == 4
end

---@return boolean result
function MateAuras.IsMists()
  return flavor == 5
end

---@return boolean result
function MateAuras.IsRetail()
  return flavor == 10
end

---@return boolean result
function MateAuras.IsClassicOrCata()
  return MateAuras.IsClassicEra() or MateAuras.IsCataClassic()
end

---@return boolean result
function MateAuras.IsClassicOrCataOrMists()
  return MateAuras.IsClassicOrCata() or MateAuras.IsMists()
end

---@return boolean result
function MateAuras.IsCataOrMists()
  return MateAuras.IsCataClassic() or MateAuras.IsMists()
end

function MateAuras.IsCataOrMistsOrRetail()
  return MateAuras.IsCataClassic() or MateAuras.IsMists() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsMistsOrRetail()
  return MateAuras.IsMists() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsCataOrRetail()
  return MateAuras.IsCataClassic() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsClassicOrWrath()
  return MateAuras.IsClassicEra() or MateAuras.IsWrathClassic()
end

---@return boolean result
function MateAuras.IsWrathOrCata()
  return MateAuras.IsWrathClassic() or MateAuras.IsCataClassic()
end

---@return boolean result
function MateAuras.IsWrathOrCataOrMists()
  return MateAuras.IsWrathClassic() or MateAuras.IsCataClassic() or MateAuras.IsMists()
end

---@return boolean result
function MateAuras.IsWrathOrCataOrMistsOrRetail()
  return MateAuras.IsWrathClassic() or MateAuras.IsCataClassic() or MateAuras.IsMists() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsClassicOrWrathOrCata()
  return MateAuras.IsClassicEra() or MateAuras.IsWrathClassic() or MateAuras.IsCataClassic()
end

---@return boolean result
function MateAuras.IsClassicOrWrathOrCataOrMists()
  return MateAuras.IsClassicEra() or MateAuras.IsWrathClassic() or MateAuras.IsCataClassic() or MateAuras.IsMists()
end

---@return boolean result
function MateAuras.IsWrathOrMistsOrRetail()
  return MateAuras.IsWrathClassic() or MateAuras.IsMists() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsWrathOrMists()
  return MateAuras.IsWrathClassic() or MateAuras.IsMists()
end

---@return boolean result
function MateAuras.IsWrathOrRetail()
  return MateAuras.IsWrathClassic() or MateAuras.IsRetail()
end

---@return boolean result
function MateAuras.IsTWW()
  return MateAuras.BuildInfo >= 110000
end

---@param ... string
MateAuras.prettyPrint = function(...)
  print("|cff9900ffMateAuras:|r ", ...)
end

---@type MateAurasSaved
MateAurasSaved = MateAurasSaved or {};
if not next(MateAurasSaved) or not (MateAurasSaved and MateAurasSaved.displays and next(MateAurasSaved.displays)) then
  C_AddOns.EnableAddOn("WeakAuras")
  C_AddOns.LoadAddOn("WeakAuras")
  if WeakAurasSaved then
    MateAurasSaved = CopyTable(WeakAurasSaved)
    MateAurasSaved.m33Migrated = true
    C_AddOns.DisableAddOn("WeakAuras")
  end
end
if not MateAurasSaved.m33Migrated then
  if not MateAurasSaved.migrationPromptCanceled then
    C_AddOns.EnableAddOn("WeakAuras")
    C_AddOns.LoadAddOn("WeakAuras")
  end
  if WeakAurasSaved then
      libsAreOk = false
      StaticPopupDialogs["MATEAURAS_MIGRATION_PROMPT"] = {
        text = "MateAuras detected data from WeakAuras. Do you want to migrate your settings from WeakAuras to MateAuras? This will delete existing settings for MateAuras and cannot be undone.\n\nIf you will change your mind enable \"MateAuras Settings Migration\" in addons list to see this prompt again.",
        button1 = YES or "Yes",
        button2 = NO or "No",
        showAlert = true,
        OnAccept = function()
          MateAurasSaved = CopyTable(WeakAurasSaved)
          MateAurasSaved.m33Migrated = true
          C_AddOns.DisableAddOn("WeakAuras")
          C_UI.Reload()
        end,
        OnCancel = function()
          MateAurasSaved.migrationPromptCanceled = true
          C_AddOns.DisableAddOn("WeakAuras")
          C_UI.Reload()
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = false,
        preferredIndex = 5,
      }
      StaticPopup_Show("MATEAURAS_MIGRATION_PROMPT")
  end
end

-- Force enable MateAurasCompanion and Archive because some addon managers interfere with it
C_AddOns.EnableAddOn("MateAurasCompanion")
C_AddOns.EnableAddOn("MateAurasArchive")

local libsAreOk = true
do
  local StandAloneLibs = {
    "Archivist",
    "LibStub"
  }
  local LibStubLibs = {
    "CallbackHandler-1.0",
    "AceTimer-3.0",
    "AceSerializer-3.0",
    "AceComm-3.0",
    "LibSharedMedia-3.0",
    "LibDataBroker-1.1",
    "LibCompress",
    "SpellRange-1.0",
    "LibCustomGlow-1.0",
    "LibDBIcon-1.0",
    "LibGetFrame-1.0",
    "LibSerialize",
  }
  if MateAuras.IsRetail() then
    tinsert(LibStubLibs, "LibSpecialization")
    AddonCompartmentFrame:RegisterAddon({
      text = AddonName,
      icon = "Interface\\AddOns\\MateAuras\\Media\\Textures\\icon.blp",
      registerForAnyClick = true,
      notCheckable = true,
      func = function(button, menuInputData, menu)
        local mouseButton = menuInputData.buttonName
        if mouseButton == "LeftButton" then
          if IsShiftKeyDown() then
            if not (MateAuras.IsOptionsOpen()) then
              MateAuras.Toggle()
            end
          else
            MateAuras.OpenOptions()
          end
        elseif mouseButton == "MiddleButton" then
          MateAuras.ToggleMinimap()
        else
          MateAurasProfilingFrame:Toggle()
        end
      end,
      funcOnEnter = function(button)
        MenuUtil.ShowTooltip(button, function(tooltip)
          MateAuras.GenerateTooltip(true, tooltip)
        end)
      end,
      funcOnLeave = function(button)
        MenuUtil.HideTooltip(button)
      end,
    })
  end
  for _, lib in ipairs(StandAloneLibs) do
    if not lib then
        libsAreOk = false
        MateAuras.prettyPrint("Missing library:", lib)
    end
  end
  if LibStub then
    for _, lib in ipairs(LibStubLibs) do
        if not LibStub:GetLibrary(lib, true) then
          libsAreOk = false
          MateAuras.prettyPrint("Missing library:", lib)
        end
    end
  else
    libsAreOk = false
  end
end

function MateAuras.IsLibsOK()
  return libsAreOk
end

if MateAuras.BuildInfo < 120000 then
  libsAreOk = false
  StaticPopupDialogs["MateAuras_OUTDATED_CLIENT_MIDNIGHT"] = {
    text = "This version of MateAuras won't load on pre Midnight clients.",
    button1 = OKAY,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
    preferredIndex = 5,
  }
  StaticPopup_Show("MateAuras_OUTDATED_CLIENT_MIDNIGHT")
  return
end

if not libsAreOk then
  C_Timer.After(1, function()
    MateAuras.prettyPrint("MateAuras is missing necessary libraries. Please reinstall a proper package.")
  end)
end

-- These function stubs are defined here to reduce the number of errors that occur if MateAuras.lua fails to compile
--- @type fun(regionType: string, createFunction: function, modifyFunction: function, defaults: table, properties: table|function|nil, validate: function?))
function Private.RegisterRegionType(_, _, _ ,_)
end

---@type fun(regionType: string, createOptions: function, icon: string|function, displayName: string, createThumbnail: function?, modifyThumbnail: function?, description: string?, templates: table?, getAnchors: function?)
---@diagnostic disable-next-line: duplicate-set-field
function Private.RegisterRegionOptions(_, _ , _ ,_ )
end

function Private.StartProfileSystem(_)
end

function Private.StartProfileAura(_)
end

function Private.StopProfileSystem(_)
end

function Private.StopProfileAura(_)
end

---@type fun()
function Private.StartProfileUID()
end

---@type fun()
function Private.StopProfileUID()
end

Private.ExecEnv = {}

-- If MateAuras shuts down due to being installed on the wrong target, keep the bindings from erroring
--- @type fun(type: string)
---@diagnostic disable-next-line: duplicate-set-field
function MateAuras.StartProfile(_)
end

---@diagnostic disable-next-line: duplicate-set-field
function MateAuras.StopProfile()
end

---@diagnostic disable-next-line: duplicate-set-field
function MateAuras.PrintProfile()
end

function MateAuras.CountWagoUpdates()
  -- XXX this is to work around the Companion app trying to use our stuff!
  return 0
end

function MateAuras.PurgeSecrets(tbl)
  for k, v in pairs(tbl) do
    if issecretvalue(v) then
      tbl[k] = nil
    end
  end
end

function MateAuras.IsDurationObject(duration)
  local t = type(duration)
  if t == "userdata" and duration.GetRemainingDuration then
    return true
  end
  return false
end
