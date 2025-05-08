-- This file contains the main logic for the addon.

local frame = CreateFrame("Frame", "HealthDisplayFrame", UIParent)
frame:SetSize(200, 200) -- Make the frame square for the circular texture
frame:SetPoint("CENTER")

-- Create a circular texture
local healthCircle = frame:CreateTexture(nil, "ARTWORK")
healthCircle:SetTexture("Interface\\AddOns\\MyWoWAddon\\traffic.blp") -- Replace with your circular texture
healthCircle:SetAllPoints(frame)

-- Mask the texture to make it circular
local mask = frame:CreateMaskTexture()
mask:SetTexture("Interface\\AddOns\\MyWoWAddon\\traffic.blp") -- Replace with your circular mask texture
mask:SetAllPoints(frame)
healthCircle:AddMaskTexture(mask)

-- Function to update the circular health display
local function UpdateHealth()
    local health = UnitHealth("player")
    local maxHealth = UnitHealthMax("player")
    local healthPercent = health / maxHealth

    -- Set the texture's alpha or adjust the texture coordinates to reflect health percentage
    healthCircle:SetAlpha(healthPercent) -- Example: Adjust alpha based on health percentage
end

frame:RegisterEvent("UNIT_HEALTH")
frame:RegisterEvent("UNIT_MAXHEALTH")
frame:SetScript("OnEvent", UpdateHealth)

UpdateHealth() -- Initial update when the addon is loaded