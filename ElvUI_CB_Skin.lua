local E, L, V, P, G,_ = unpack(ElvUI)
local S = E:GetModule('Skins')
local ParentWidth = ElvUIParent:GetWidth()


local SkinCB = CreateFrame("Frame")
	SkinCB:RegisterEvent("PLAYER_ENTERING_WORLD")
	SkinCB:SetScript("OnEvent", function(self, event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	if not IsAddOnLoaded("ChocolateBar") then return end
		-- Skin bars (Up to 20)
		for i = 1, 20 do   	
		local f = _G["ChocolateBar"..i]
			if f then
				f:StripTextures()
				f:SetTemplate("Transparent")
			end
		end

if BarsEnable == true then
	if ChocolateBar2 and ChocolateBar3 then -- Do they really exist!
-- Then change their template.	
	ChocolateBar2:SetTemplate("Default")
	ChocolateBar3:SetTemplate("Default")
-- Set Positions of Bar2 and Bar 3
-- X Position
	if BarsPositionX == nil then
		x = E.UIParent:GetWidth()/6.25
	else
		x = BarsPositionX
	end
-- Y Positions
	if BarsPositionY == nil then
		y = 32--ChocolateBar1:GetHeight() + ChocolateBar2:GetHeight()/2		
	else
		y = BarsPositionY
	end
-- + 1
		
-- Set Width of Bar 2 and Bar 3.
	if BarsWidth == nil then 
		ChocolateBar2:SetWidth(125)
		ChocolateBar3:SetWidth(125)
	else
		ChocolateBar2:SetWidth(BarsWidth)
		ChocolateBar3:SetWidth(BarsWidth)
	end
-- Set Height of Bar 2 and Bar 3.
	if BarsHeight == nil then 
		ChocolateBar2:SetHeight(ChocolateBar1:GetHeight())
		ChocolateBar3:SetHeight(ChocolateBar1:GetHeight())
	else
		ChocolateBar2:SetHeight(BarsHeight)
		ChocolateBar3:SetHeight(BarsHeight)
	end
		ChocolateBar2:ClearAllPoints()
		ChocolateBar2:SetPoint("TOPRIGHT", ElvUIParent, "TOP", -x, -y)
		ChocolateBar2:SetFrameLevel(5)
		ChocolateBar3:ClearAllPoints()
		ChocolateBar3:SetPoint("TOPLEFT", ElvUIParent, "TOP", x, -y)
		ChocolateBar3:SetFrameLevel(5)

	local x = ChocolateBar2:GetWidth()/4

		cbBar2Left = CreateFrame('Frame', nil, ChocolateBar2)
		cbBar2Left:Point('BOTTOM', ChocolateBar2, 'TOP',-x,0)
		cbBar2Left:Width(2)
		cbBar2Left:Height(y+1-(ChocolateBar1:GetHeight()))
		cbBar2Left:SetTemplate("Default")	

		cbBar2Right = CreateFrame('Frame', nil, ChocolateBar2)
		cbBar2Right:Point('BOTTOM', ChocolateBar2, 'TOP', x,0)
		cbBar2Right:Width(2)
		cbBar2Right:Height(y+1-(ChocolateBar1:GetHeight()))
		cbBar2Right:SetTemplate("Default")	

		cbBar3Left = CreateFrame('Frame', nil, ChocolateBar3)
		cbBar3Left:Point('BOTTOM', ChocolateBar3, 'TOP',-x,0)
		cbBar3Left:Width(2)
		cbBar3Left:Height(y+1-(ChocolateBar1:GetHeight()))
		cbBar3Left:SetTemplate("Default")

		cbBar3Right = CreateFrame('Frame', nil, ChocolateBar3)
		cbBar3Right:Point('BOTTOM', ChocolateBar3, 'TOP', x,0)
		cbBar3Right:Width(2)
		cbBar3Right:Height(y+1-(ChocolateBar1:GetHeight()))
		cbBar3Right:SetTemplate("Default")
	
	-- Move Raid Utility Button
		if RaidUtilityEnable == true then
			if RaidUtilityPosition == nil then
				x = E.UIParent:GetWidth()/-3.5
				RaidUtility_ShowButton:SetPoint("TOP", ChocolateBar1, "BOTTOM", x, 0)
			else
				RaidUtility_ShowButton:SetPoint("TOP", ChocolateBar1, "BOTTOM", RaidUtilityPosition, 0)
			end
		else
			-- DO NOTHING!
		end
	end
end
	end)