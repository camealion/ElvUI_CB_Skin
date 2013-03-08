local E, L, V, P, G,_ = unpack(ElvUI)
local S = E:GetModule('Skins')
local AceGUI = LibStub("AceGUI-3.0")
local ChocolateBar = LibStub("AceAddon-3.0"):GetAddon("ChocolateBar")
local version = GetAddOnMetadata("ChocolateBar","X-Curse-Packaged-Version") or ""

-- Get Addon's name and Blizzard's Addon Stub
local AddonName, Addon = ...
-- Load AceStuff
local CBSkin = LibStub("AceAddon-3.0"):NewAddon(AddonName, "AceConsole-3.0")

local CBSkinOption = CreateFrame("Frame")
	CBSkinOption:RegisterEvent("ADDON_LOADED")
	CBSkinOption:SetScript("OnEvent", function(self, event, addon)
	if not IsAddOnLoaded("ElvUI_Config") then return end
	
	E.PopupDialogs["Bar_Check"] = {
	text = "You need to create ChocolateBar's 2 and 3 before enabling this option. Would you like me to do this for you?",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
					if not ChocolateBar2 then
						local name = ChocolateBar:AddBar() 
						if not ChocolateBar3 then
							local name = ChocolateBar:AddBar() 
						end
					end
					ReloadUI()
				end,
	--OnCancel = function() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
}
-- Creating a Config

E.Options.args.skins.args.CBSkinOptions = {
	name = "ChocolateBar",
	handler = CBSkin,
	type = 'group',
	order = 1, 
		args = {
			intro = {
				order = 1,
				type = "description",
				name = "ElvUI ChocolateBar Skin Options by Camealion",
			},
			Bar2and3 = {
				order = 2,
				type = "group",
				name = 'Bar 2 and Bar 3',
				guiInline = true,
				args = {
					Enable = {
						type = 'toggle',
						order = 1,
						name = 'Enable',
						desc = 'Enable Bar 2 and Bar 3 at the top below Bar 1.',
						get = function(info) return BarsEnable end,
						set = function(info, value) BarsEnable = value ; SetCheck() end,--E:StaticPopup_Show('CONFIG_RL') end
					},
					ScreenShot = {
						type = 'execute',
						order = 2,
						name = 'View Screen Shot',
						desc = 'View a screen shot of what this looks like.',
						func = function() ToggleScreenShot() end
					},
					Width = {
						order = 1,
						type = "range",
						name = 'Width',
						desc = 'Set the width of bar 2 and bar 3.',
						disabled = function() return not BarsEnable end,
						get = 'GetBarWidth',
						set = function(info, value) BarsWidth = value; E:StaticPopup_Show('CONFIG_RL') end,
						min = 10, max = 300, step = 1,
					},
					Height = {
						order = 2,
						type = "range",
						name = 'Height',
						desc = 'Set the width of bar 2 and bar 3.',
						disabled = function() return not BarsEnable end,
						get = 'GetBarHeight',
						set = function(info, value) BarsHeight = value; E:StaticPopup_Show('CONFIG_RL') end,
						min = 10, max = 40, step = 1,
					},
					PositionX = {
						order = 3,
						type = "range",
						name = 'Position-X',
						desc = 'Set Position of Bar 2 and 3 from the center.',
						disabled = function() return not BarsEnable end,
						get = 'GetBarPositionX',
						set = function(info, value) BarsPositionX = value; E:StaticPopup_Show('CONFIG_RL') end,
						min = 10, max = 500, step = 1,
					},
					PositionY = {
						order = 4,
						type = "range",
						name = 'Position-Y',
						desc = 'Set Position of Bar 2 and 3 from the top of the screen.',
						disabled = function() return not BarsEnable end,
						get = 'GetBarPositionY',
						set = function(info, value) BarsPositionY = value; E:StaticPopup_Show('CONFIG_RL') end,
						min = 5, max = 50, step = 1,
					},
				},
			},
			RaidButton = {
				order = 3,
				type = "group",
				name = 'Raid Utility Button',
				guiInline = true,
				args = {
					RaidUtilityEnable = {
						type = 'toggle',
						order = 1,
						name = 'Enable',
						desc = 'Disable this if you are not using Bar 1 at the top of the screen.',
						get = function(info) return RaidUtilityEnable end,
						set = function(info, value) RaidUtilityEnable = value; E:StaticPopup_Show('CONFIG_RL') end
					},
					Position = {
						order = 2,
						type = "range",
						name = 'Position',
						desc = 'Set Position of the Raid Utility Button.',
						disabled = function() return not RaidUtilityEnable end,
						get = 'GetRaidUtilityPosition',
						set = function(info, value) RaidUtilityPosition = value; E:StaticPopup_Show('CONFIG_RL') end,
						min = ceil(-960 + (RaidUtilityPanel:GetWidth()/2)), max = ceil(959 - (RaidUtilityPanel:GetWidth()/2)), step = 1,
					},
					ToggleRaidUtility = {
						type = 'execute',
						order = 2,
						name = 'Show Raid Utility',
						desc = 'Temporarily show the Raid Utility while not in a group.',
						func = function() ToggleRaidUtility() end
					},
				},
			},
		bars={
			name = "ChocolateBar".." "..version.." ".."Options",
			type ="group",
			order = 4,
			guiInline = true,
			args ={
				-- CreateBar = { -- Disabled for now, Ataches new bars #4+ to 2 and 3.
					-- type = 'execute',
					-- order = 0,
					-- name = L["Create Bar"],
		            -- desc = L["Create New Bar"],
		            -- func = function() local name = ChocolateBar:AddBar(); E:StaticPopup_Show('CONFIG_RL') end,
				-- },
				ChololateBarOptions = {
					type = 'execute',
					order = 0,
					name = "Options",
		            desc = "Open ChocolatBar's Options",
		            func = function() ChocolateBar:ChatCommand() end,
				},
			},
		},
	},
}
function SetCheck()
	if ChocolateBar2 and ChocolateBar3 then
    E:StaticPopup_Show('CONFIG_RL')
	else
	E:StaticPopup_Show('Bar_Check')
	end
end
function CBSkin:GetBarWidth(info)
	if BarsWidth == nil then
    return 125
	else
	return BarsWidth
	end
end
function CBSkin:GetBarHeight(info)
	if BarsHeight == nil then
    return ChocolateBar1:GetHeight()
	else
	return BarsHeight
	end
end
function CBSkin:GetBarPositionX(info)
	if BarsPositionX == nil then
    return E.UIParent:GetWidth()/6
	else
	return BarsPositionX
	end
end
function CBSkin:GetBarPositionY(info)
	if BarsPositionY == nil then
    return 32
	else
	return BarsPositionY
	end
end
function CBSkin:GetRaidUtilityPosition(info)
	if RaidUtilityPosition == nil then
    return E.UIParent:GetWidth()/-3.5
	else
	return RaidUtilityPosition
	end
end

function ToggleScreenShot()
	local Preview = AceGUI:Create("Frame")
		Preview:SetTitle("Preview Screenshot")
		Preview:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
		Preview:SetWidth(1100)
		Preview:SetHeight(200)
	local Image = AceGUI:Create("InteractiveLabel")
		Image:SetImage([[Interface\AddOns\ElvUI_CB_Skin\media\Bar3and4.tga]])
		Image:SetImageSize(1024, 128)
		Preview:AddChild(Image)
	AceGUI:RegisterLayout("Custom_Layout",
		function(content, children)
			children[1]:SetWidth(content:GetWidth() or 0)
			children[1].frame:SetPoint("CENTER",content,"CENTER")
			children[1].frame:Show()
		end
	)
	Preview:SetLayout("Custom_Layout")
end

function ToggleRaidUtility()
	if RaidUtility_ShowButton then
		RaidUtility_ShowButton:Show()
		--E:Print('The current screen resolution is ' .. ({GetScreenResolutions()})[GetCurrentResolution()])
		--E:Print('ElvUIParent is '.. ceil(ElvUIParent:GetWidth()))
		--E:Print('UIParent is '.. ceil(UIParent:GetWidth()))
		--E:Print('WorldFrame is '.. ceil(WorldFrame:GetWidth()))
		--E:Print('E.UIParent is '.. E.UIParent:GetWidth())
		--E:Print('RaidUtilityPanel is '.. RaidUtilityPanel:GetWidth())
		--E:Print('UIParent:GetScale() is '.. UIParent:GetScale())
	end
end

-- Register the Options
LibStub("AceConfig-3.0"):RegisterOptionsTable(AddonName, E.Options.args.skins.args.CBSkinOptions, nil)
-- This allows us to create our config dialog
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")
local ACR = LibStub("AceConfigRegistry-3.0")

-- Register Slash Commands
CBSkin:RegisterChatCommand("cbskin", "OpenGUICommand")
-- Process the slash command ('input' contains whatever follows the slash command)
function CBSkin:OpenGUICommand(input)
  local mode = 'Close'
    if not ACD.OpenFrames[AddonName] then
        mode = 'Open'
    end
    ACD[mode](ACD, AddonName)
end
end)