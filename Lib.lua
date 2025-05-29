Vendormatic = LibStub("AceAddon-3.0"):GetAddon("Vendormatic")

function Vendormatic:ToggleAddonOptions(Parameter)

    if Parameter == nil or Parameter == "" then
        if InCombatLockdown() == false then
            InterfaceOptionsFrame_OpenToCategory("Vendormatic")
        end
    else

        Parameter = string.lower(Parameter)

        local ChatOptions = {}

        for Option in Parameter:gmatch("%w+") do
            table.insert(ChatOptions, Option)
        end

        local ChatOption = ChatOptions[1]
        local Function = ChatOptions[2]
        local Value = ChatOptions[3]

        if ChatOption == "blacklist" then

            if Function == "add" then

                if self.db.profile.UserBlacklist[Value] == nil then
                    self.db.profile.UserBlacklist[Value] = true

                    local ItemName = C_Item.GetItemInfo(Value) 

                    self:Print(string.format("Added item %s to the blacklist", ItemName))
                end

            elseif Function == "remove" then

                if self.db.profile.UserBlacklist[Value] ~= nil then
                    self.db.profile.UserBlacklist[Value] = nil

                    local ItemName = C_Item.GetItemInfo(Value)

                    self:Print(string.format("Removed item %s from the blacklist", ItemName))
                end

            elseif Function == "list" then
                self:Print("Selling Blacklist")

                if self.db.profile.UserBlacklist ~= nil then

                    local index = 1

                    for BlacklistItemID, Value in pairs(self.db.profile.UserBlacklist) do

                        local ItemName = C_Item.GetItemInfo(BlacklistItemID) 

                        if itemName ~= nil then
                            self:Print(string.format("Index: %s ItemID: %s Item: %s", index, BlacklistItemID, ItemName))
                        else
                            self:Print(string.format("Index: %s ItemID: %s Item: %s", index, BlacklistItemID, "Unknown Item ID"))
                        end
                    end

                else
                    self:Print("There are no items on the blacklist")
                end

            end
        end
    end
end

function Vendormatic:GetAddonVersion()
    return C_AddOns.GetAddOnMetadata("Vendormatic", "Version")
end

function Vendormatic:GetAddonGameVersion()
    return select(4, GetBuildInfo())
end

function Vendormatic:GetTableKeyByValue(Table, KeyValue)

    for Key, Value in pairs(Table) do
        if Value == KeyValue then
            return Key
        end

    end 

end

function Vendormatic:GetQualityColor(Quality)
    local r, g, b, hex = C_Item.GetItemQualityColor(Quality)

    return hex
end

function Vendormatic:Enable()
   self.db.profile.Settings.General.Enabled = true
end

function Vendormatic:Disable()
    self.db.profile.Settings.General.Enabled = false
end

function Vendormatic:Status()
    return self.db.profile.Settings.General.Enabled
end

function Vendormatic:GetPlayerClass()

    local _, PlayerClass = UnitClass('player')

    return PlayerClass
end

function Vendormatic:GetItemIDByLink(ItemLink)
    return tonumber(strmatch(ItemLink, "item:(%d+)"))
end

function Vendormatic:GetItemLevel(Item)
    local _, _, _, itemLevel = C_Item.GetItemInfo(Item)

    return itemLevel
end

function Vendormatic:GetItemPrice(Item)

    local _, _, _, _, _, _, _, _, _, _, sellPrice = C_Item.GetItemInfo(Item)

    return sellPrice
end


function Vendormatic:GetItemInfo(Item)
    local _, _, ItemQuality, _, _, _, _, _, _, _, ItemPrice, ItemType, ItemSubType, ItemBindType = GetItemInfo(Item)
    local IsItemBoe = false


    if ItemBindType == 2 then
        IsItemBoe = true
    end

    return ItemQuality, ItemPrice, ItemType, ItemSubType, IsItemBoe
end

function Vendormatic:IsItemUseableByPlayer(ItemType, ItemSubType)

    local Dataset = self.UnusableItemTypes[self.Variables.PlayerClass][ItemType]

    if Dataset ~= nil then
        for Key, Value in pairs(self.UnusableItemTypes[self.Variables.PlayerClass][ItemType]) do
            if ItemSubType == Value then
                return false
            end
        end
    end
    
    return true
end

function Vendormatic:GetMoneyString(ItemPriceAsDecimal, Thousands)
    return GetMoneyString(ItemPriceAsDecimal, Thousands)
end

function Vendormatic:DoesSellCriteriaMatch(Item)

    local ItemID = self:GetItemIDByLink(Item)
    local ItemLevel = self:GetItemLevel(Item)

    local ItemQuality, ItemPrice, ItemType, ItemSubType, ItemIsBoe = self:GetItemInfo(Item)

    local ItemIsUsableByPlayer = self:IsItemUseableByPlayer(ItemType, ItemSubType)

    if self.SellBlacklist[ItemID] == true then
        return false, "ITEMONBLACKLIST"
    end

    if self.FortuneCards[ItemID] == true and self.db.profile.Settings.General.Sell.SellFortuneCardsAlways == true then
        return true, "FORTUNECARD"
    end

    if ItemType ~= 2 and ItemType ~= 4 and ItemType ~= 15 then
        return false, "BADITEMTYPE"
    end

    if ItemIsBoe == true and self.db.profile.Settings.General.Sell.ExcludeBoe == true then
        return false, "EXCLUDEBOE"
    end

    if ItemIsUsableByPlayer == false and self.db.profile.Settings.General.Sell.SellItemsUnusableByPlayer == true then
        return true, "ITEMNOTUSABLEBYPLAYER"
    end

    if ItemQuality <= self.db.profile.Settings.General.Sell.SellItemsBelowQualityValue and self.db.profile.Settings.General.Sell.SellItemsBelowQuality == true then
        return true, "QUALITY"
    end

    if ItemPrice <= self.db.profile.Settings.General.Sell.SellItemsBlowPriceValue and self.db.profile.Settings.General.Sell.SellItemsBelowPrice == true then
        return true, "PRICE"
    end

    if ItemLevel <= self.db.profile.Settings.General.Sell.SellItemsBelowItemLevelValue and self.db.profile.Settings.General.Sell.SellItemsBelowItemLevel == true then
        return true, "ITEMLEVEL"
    end

    return false, "NOCRITERIAMATCH"

end