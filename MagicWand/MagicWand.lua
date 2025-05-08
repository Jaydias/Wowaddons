local f = CreateFrame("Frame", "MovableCircle", UIParent)
f:SetSize(200, 200)  -- Width, Height
f:SetPoint("CENTER")
f:SetMovable(true)
f:EnableMouse(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", f.StopMovingOrSizing)

-- Make it see-through
f:SetAlpha(0.8)

-- Add circular texture
local t = f:CreateTexture(nil, "BACKGROUND")
t:SetAllPoints(true)
t:SetTexture("Interface\\AddOns\\MagicWand\\dong.blp")  -- Ensure this file exists in the correct path

-- Add a border for better visibility
local border = f:CreateTexture(nil, "OVERLAY")
border:SetAllPoints(true)
border:SetColorTexture(1, 1, 1, 0.2)  -- Light border for visibility

-- Add a tooltip for interaction
f:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    GameTooltip:AddLine("Drag me around!", 1, 1, 1)
    GameTooltip:Show()
end)
f:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)
