﻿local SkinCB = CreateFrame("Frame")
	SkinCB:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinCB:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("ChocolateBar") then return end
			
if Tukui then
	UpperRepExpBarHolder = CreateFrame('Frame', nil, ChocolateBar1)
	UpperRepExpBarHolder:SetWidth(WorldFrame:GetWidth()/4)
end
			
local x = UpperRepExpBarHolder:GetWidth()/2 + 25
local y = ChocolateBar1:GetHeight() + ChocolateBar2:GetHeight()/2 + 1

	for i = 1, 20 do   	
	local f = _G["ChocolateBar"..i]
		if f then
			f:StripTextures(true)
			f:SetTemplate("Default")
			ChocolateBar1:CreateShadow("Default")
			ChocolateBar2:SetFrameStrata("FULLSCREEN")-- Sets them above cbBar 1.
			ChocolateBar2:SetWidth(UpperRepExpBarHolder:GetWidth()/3)
			ChocolateBar2:SetHeight(23)
			ChocolateBar2:ClearAllPoints()
			ChocolateBar2:SetPoint("TOPRIGHT", ElvUIParent, "TOP", -x, -y)
			ChocolateBar2:CreateShadow("Default")			
			ChocolateBar3:SetFrameStrata("FULLSCREEN")	
			ChocolateBar3:SetWidth(UpperRepExpBarHolder:GetWidth()/3)
			ChocolateBar3:SetHeight(23)
			ChocolateBar3:ClearAllPoints()
			ChocolateBar3:SetPoint("TOPLEFT", ElvUIParent, "TOP", x, -y)
			ChocolateBar3:CreateShadow("Default")			
			if ElvUI then UpperRepExpBarHolder:SetPoint("TOP", ChocolateBar1, "BOTTOM", 0, 0) end
			if ElvUI then WorldStateAlwaysUpFrame:SetPoint("TOP", MMHolder, "BOTTOM", 0, 0) end
			if ElvUI then ShowButton:SetPoint("TOP", ChocolateBar1, "BOTTOM", -400, 0) end
		end	
		
		if ElvUI then
			if ChocolateBar4 then
				ChocolateBar4:StripTextures(true)
				ChocolateBar4:SetWidth(205)
				ChocolateBar4:SetHeight(22)	
				ChocolateBar4:ClearAllPoints()
				ChocolateBar4:SetPoint("RIGHT", RightChatTab, "RIGHT", 0, 0)
			end
		else
			if ChocolateBar4 then
				ChocolateBar4:StripTextures(true)
				ChocolateBar4:SetWidth(335)
				ChocolateBar4:SetHeight(23)	
				ChocolateBar4:ClearAllPoints()
				ChocolateBar4:SetPoint("RIGHT", TukuiTabsRightBackground, "RIGHT", 0, 0)
			end
		end
	
local x = ChocolateBar2:GetWidth()/4
	
	cbBar2Left = CreateFrame('Frame', nil, ChocolateBar2)
	cbBar2Left:Point('BOTTOM', ChocolateBar2, 'TOP',-x,0)
	cbBar2Left:Width(2)
	cbBar2Left:Height(ChocolateBar2:GetHeight()/2)
	cbBar2Left:SetTemplate('Default')
	cbBar2Left:SetFrameLevel(ChocolateBar2:GetFrameLevel())
	
	cbBar2Right = CreateFrame('Frame', nil, ChocolateBar2)
	cbBar2Right:Point('BOTTOM', ChocolateBar2, 'TOP', x,0)
	cbBar2Right:Width(2)
	cbBar2Right:Height(ChocolateBar2:GetHeight()/2)
	cbBar2Right:SetTemplate('Default')	
	cbBar2Right:SetFrameLevel(ChocolateBar2:GetFrameLevel())

	cbBar3Left = CreateFrame('Frame', nil, ChocolateBar3)
	cbBar3Left:Point('BOTTOM', ChocolateBar3, 'TOP',-x,0)
	cbBar3Left:Width(2)
	cbBar3Left:Height(ChocolateBar3:GetHeight()/2)
	cbBar3Left:SetTemplate('Default')
	cbBar3Left:SetFrameLevel(ChocolateBar3:GetFrameLevel())
	
	cbBar3Right = CreateFrame('Frame', nil, ChocolateBar3)
	cbBar3Right:Point('BOTTOM', ChocolateBar3, 'TOP', x,0)
	cbBar3Right:Width(2)
	cbBar3Right:Height(ChocolateBar3:GetHeight()/2)
	cbBar3Right:SetTemplate('Default')	
	cbBar3Right:SetFrameLevel(ChocolateBar3:GetFrameLevel())
	
	end
			
end)