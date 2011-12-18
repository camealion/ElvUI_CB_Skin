local SkinCB = CreateFrame("Frame")
	SkinCB:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinCB:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("ChocolateBar") then return end
			
			
	for i = 1, 20 do    
	local f = _G["ChocolateBar"..i]
		if f then
			f:StripTextures(true)
			f:SetTemplate("Default")
			ChocolateBar2:SetFrameStrata("FULLSCREEN")-- Sets them above cbBar 1.
			ChocolateBar2:SetWidth(126.92)
			ChocolateBar2:SetHeight(23)
			ChocolateBar2:SetPoint("TOP", ElvUIParent, "TOP", -225, -32.5)
			ChocolateBar3:SetFrameStrata("FULLSCREEN")	
			ChocolateBar3:SetWidth(126.92)
			ChocolateBar3:SetHeight(23)	
			ChocolateBar3:SetPoint("TOP", ElvUIParent, "TOP", 225, -32.5)
			UpperRepExpBarHolder:SetPoint("TOP", ChocolateBar1, "BOTTOM", 0, 0)
			if ElvUI then WorldStateAlwaysUpFrame:SetPoint("TOP", MMHolder, "BOTTOM", 0, 0) end
			ShowButton:SetPoint("TOP", ChocolateBar1, "BOTTOM", -400, 0)
		end	
		
		if ElvUI then
			if ChocolateBar4 then
		ChocolateBar4:StripTextures(true)
		ChocolateBar4:SetWidth(88.5)
		ChocolateBar4:SetHeight(22)	
		ChocolateBar4:ClearAllPoints()
		ChocolateBar4:SetPoint("LEFT", LeftMiniPanel, "LEFT", 0, 0)
			end
		end
		
	cbBar2Left = CreateFrame('Frame', nil, ChocolateBar2)
	cbBar2Left:Point('BOTTOM', ChocolateBar2, 'TOP',-50,0)
	cbBar2Left:Width(2)
	cbBar2Left:Height(ChocolateBar2:GetHeight()/2)
	cbBar2Left:SetTemplate('Default')
	cbBar2Left:SetFrameLevel(ChocolateBar2:GetFrameLevel())
	
	cbBar2Right = CreateFrame('Frame', nil, ChocolateBar2)
	cbBar2Right:Point('BOTTOM', ChocolateBar2, 'TOP', 50,0)
	cbBar2Right:Width(2)
	cbBar2Right:Height(ChocolateBar2:GetHeight()/2)
	cbBar2Right:SetTemplate('Default')	
	cbBar2Right:SetFrameLevel(ChocolateBar2:GetFrameLevel())

	cbBar3Left = CreateFrame('Frame', nil, ChocolateBar3)
	cbBar3Left:Point('BOTTOM', ChocolateBar3, 'TOP',-50,0)
	cbBar3Left:Width(2)
	cbBar3Left:Height(ChocolateBar3:GetHeight()/2)
	cbBar3Left:SetTemplate('Default')
	cbBar3Left:SetFrameLevel(ChocolateBar3:GetFrameLevel())
	
	cbBar3Right = CreateFrame('Frame', nil, ChocolateBar3)
	cbBar3Right:Point('BOTTOM', ChocolateBar3, 'TOP', 50,0)
	cbBar3Right:Width(2)
	cbBar3Right:Height(ChocolateBar3:GetHeight()/2)
	cbBar3Right:SetTemplate('Default')	
	cbBar3Right:SetFrameLevel(ChocolateBar3:GetFrameLevel())
	
	end
			
end)