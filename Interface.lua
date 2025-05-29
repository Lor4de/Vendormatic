Vendormatic = LibStub("AceAddon-3.0"):GetAddon("Vendormatic")
local L = LibStub("AceLocale-3.0"):GetLocale("Vendormatic")

Vendormatic.Options = {

    name = "Vendormatic",
    handler = Vendormatic,
    type = 'group',
    args = {
        HEADER_VENDORMATIC_VERSION = {
            name = string.format("Version: %s", Vendormatic:GetAddonVersion()),
            type = "header",
            order = 0
        },
        CHECKBOX_VENDORMATIC_ENABLE = {
            type = 'toggle',
            order = 1,
            name = L["OPTIONS/VENDORMATIC/ENABLED"],
            desc = L["OPTIONS/VENDORMATIC/ENABLED/DESCRIPTION"],
            set = function(info, val) 
                if (val) then 
                    Vendormatic:Enable() 
                else 
                    Vendormatic:Disable() 
                end 
            end,
            get = function(info) 
                return Vendormatic:Status() 
            end,
            width = 'full',
        },
        HEADER_SELL = {
            name = L["OPTIONS/GROUP/SELL"],
            desc = L["OPTIONS/GROUP/SELL"],
            type = "group",
            inline = true,
            order = 2,
            args = {
                CHECKBOX_VENDORMATIC_AUTOSELL = {
                    type = 'toggle',
                    order = 1,
                    name = L["OPTIONS/AUTOSELL/ENABLED"],
                    desc = L["OPTIONS/AUTOSELL/ENABLED/DESCRIPTION"],
                    set = function(info, val) 
                        if (val) then 
                            Vendormatic.db.profile.Settings.General.Sell.Enabled = true 
                        else 
                            Vendormatic.db.profile.Settings.General.Sell.Enabled = false 
                        end 
                    end,
                    get = function(info) 
                        return Vendormatic.db.profile.Settings.General.Sell.Enabled 
                    end,
                    width = 'full',
                },
                LABEL_VENDORMATIC_INFORMATION = {
                    name = L["OPTIONS/AUTOSELL/INFORMATION"],
                    type = "description",
                    order = 2,
                },
                HEADER_CONFIGURATION = {
                    name = L["OPTIONS/GROUP/CONFIGURATION"],
                    desc = L["OPTIONS/GROUP/CONFIGURATION"],
                    type = "group",
                    inline = true,
                    order = 3,
                    disabled = function() 
                        return not Vendormatic.db.profile.Settings.General.Sell.Enabled 
                    end,
                    args = {
                        CHECKBOX_VENDORMATIC_SELLBELOWQUALITY = {
                            type = 'toggle',
                            order = 1,
                            name = L["OPTIONS/SELLITEMSBELOWMINIMUMQUALITY/ENABLED"],
                            desc = L["OPTIONS/SELLITEMSBELOWMINIMUMQUALITY/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQuality = true 
                                else Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQuality = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQuality 
                            end,
                            width = 'full',
                        },
                        DROPDOWN_VENDORMATIC_SELLBELOWQUALITY = {
                            type = 'select',
                            order = 2,
                            name = L["OPTIONS/SELLITEMSBELOWMINIMUMQUALITY/MINIMUMITEMQUALITY"],
                            desc = L["OPTIONS/SELLITEMSBELOWMINIMUMQUALITY/MINIMUMITEMQUALITY/DESCRIPTION"],
                            values = {
                                a = string.format("|c%s%s|r", Vendormatic:GetQualityColor(0), L["OPTIONS/ITEMQUALITY/POOR"]),
                                b = string.format("|c%s%s|r", Vendormatic:GetQualityColor(1), L["OPTIONS/ITEMQUALITY/COMMON"]),
                                c = string.format("|c%s%s|r", Vendormatic:GetQualityColor(2), L["OPTIONS/ITEMQUALITY/UNCOMMON"]),
                                d = string.format("|c%s%s|r", Vendormatic:GetQualityColor(3), L["OPTIONS/ITEMQUALITY/RARE"]),
                                e = string.format("|c%s%s|r", Vendormatic:GetQualityColor(4), L["OPTIONS/ITEMQUALITY/EPIC"]),
                                f = string.format("|c%s%s|r", Vendormatic:GetQualityColor(5), L["OPTIONS/ITEMQUALITY/LEGENDARY"]),
                            },
                            set = function(info, val) 
                                Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQualityValue = Vendormatic.Quality[val] 
                            end,
                            get = function(info)
                                return Vendormatic:GetTableKeyByValue(Vendormatic.Quality, Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQualityValue)
                            end,
                            disabled = function() 
                                return not Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowQuality 
                            end,
                        },
                        CHECKBOX_VENDORMATIC_SELLFORTUNECARDS = {
                            type = 'toggle',
                            order = 3,
                            name = L["OPTIONS/ALWAYSSELLFORTUNECARDS/ENABLED"],
                            desc = L["OPTIONS/ALWAYSSELLFORTUNECARDS/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.SellFortuneCardsAlways = true 
                                else Vendormatic.db.profile.Settings.General.Sell.SellFortuneCardsAlways = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellFortuneCardsAlways 
                            end,
                            width = 'full',
                        },
                        CHECKBOX_VENDORMATIC_SELLUNUSABLEBYPLAYER = {
                            type = 'toggle',
                            order = 4,
                            name = L["OPTIONS/SELLITEMSUNUSABLEBYPLAYER/ENABLED"],
                            desc = L["OPTIONS/SELLITEMSUNUSABLEBYPLAYER/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsUnusableByPlayer = true 
                                else 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsUnusableByPlayer = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsUnusableByPlayer 
                            end,
                            width = 'full',
                            confirm = function(info, val) 
                                if val then 
                                    return  L["OPTIONS/SELLITEMSUNUSABLEBYPLAYER/CONFIRM"] 
                                else 
                                    return false 
                                end 
                            end,
                        },
                        CHECKBOX_VENDORMATIC_EXCLUDEBOE = {
                            type = 'toggle',
                            order = 5,
                            name = L["OPTIONS/EXCLUDEBOEFROMSELLING/ENABLED"],
                            desc = L["OPTIONS/EXCLUDEBOEFROMSELLING/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.ExcludeBoe = true 
                                else 
                                    Vendormatic.db.profile.Settings.General.Sell.ExcludeBoe = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.ExcludeBoe 
                            end,
                            width = 'full',
                        },
                        CHECKBOX_VENDORMATIC_SELLBELOWITEMLEVEL = {
                            type = 'toggle',
                            order = 6,
                            name = L["OPTIONS/SELLITEMSBELOWITEMLEVEL/ENABLED"],
                            desc = L["OPTIONS/SELLITEMSBELOWITEMLEVEL/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevel = true 
                                else 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevel = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevel 
                            end,
                            width = 'full',
                            confirm = function(info, val) 
                                if val then 
                                    return L["OPTIONS/SELLITEMSBELOWITEMLEVEL/CONFIRM"] 
                                else 
                                    return false 
                                end 
                            end,
                        },
                        SLIDER_VENDORMATIC_SELLBELOWITEMLEVELMINIMUM = {
                            type = 'range',
                            order = 7,
                            name = L["OPTIONS/SELLITEMSBELOWITEMLEVEL/MINIMUMITEMLEVEL"],
                            desc = L["OPTIONS/SELLITEMSBELOWITEMLEVEL/MINIMUMITEMLEVEL/DESCRIPTION"],
                            set = function(info, val) 
                                Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevelValue = val 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevelValue 
                            end,
                            disabled = function() 
                                return not Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowItemLevel 
                            end,
                            width = 'full',
                            min = 5,
                            max = 600,
                            step = 1,
                            bigStep = 5,
                        },
                        CHECKBOX_VENDORMATIC_SELLBELOWITEMPRICE = {
                            type = 'toggle',
                            order = 8,
                            name = L["OPTIONS/SELLITEMSBELOWPRICE/ENABLED"],
                            desc = L["OPTIONS/SELLITEMSBELOWPRICE/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowPrice = true 
                                else 
                                    Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowPrice = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowPrice 
                            end,
                            width = 'full',
                            confirm = function(info, val) 
                                if val then 
                                    return L["OPTIONS/SELLITEMSBELOWPRICE/CONFIRM"] 
                                else 
                                    return false 
                                end 
                            end,
                        },
                        SLIDER_VENDORMATIC_SELLBELOWITEMPRICE = {
                            type = 'range',
                            order = 9,
                            name = L["OPTIONS/SELLITEMSBELOWPRICE/MINIMUMITEMPRICE"],
                            desc = L["OPTIONS/SELLITEMSBELOWPRICE/MINIMUMITEMPRICE/DESCRIPTION"],
                            set = function(info, val) 
                                Vendormatic.db.profile.Settings.General.Sell.SellItemsBlowPriceValue = val * 10000
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Sell.SellItemsBlowPriceValue / 10000 
                            end,
                            disabled = function() 
                                return not Vendormatic.db.profile.Settings.General.Sell.SellItemsBelowPrice 
                            end,
                            width = 'full',
                            min = 1,
                            max = 1000,
                            step = 1,
                            bigStep = 5,
                        },
                        LABEL_VENDORMATIC_HINT_SIMULATION = {
                            name = L["OPTIONS/AUTOSELL/HINTSIMULATION"],
                            type = "description",
                            order = 10,
                        },
                    }
                },
            }
        },
        HEADER_REPAIR = {
            name = L["OPTIONS/GROUP/REPAIR"],
            desc = L["OPTIONS/GROUP/REPAIR"],
            type = "group",
            inline = true,
            order = 3,
            args = {
                CHECKBOX_VENDORMATIC_AUTOREPAIR = {
                    type = 'toggle',
                    order = 1,
                    name = L["OPTIONS/AUTOREPAIR/ENABLED"],
                    desc = L["OPTIONS/AUTOREPAIR/ENABLED/DESCRIPTION"],
                    set = function(info, val) 
                        if (val) then 
                            Vendormatic.db.profile.Settings.General.Repair.Enabled = true 
                        else 
                            Vendormatic.db.profile.Settings.General.Repair.Enabled = false 
                        end 
                    end,
                    get = function(info) 
                        return Vendormatic.db.profile.Settings.General.Repair.Enabled 
                    end,
                    width = 'full',
                },
                HEADER_CONFIGURATION = {
                    name = L["OPTIONS/GROUP/CONFIGURATION"],
                    desc = L["OPTIONS/GROUP/CONFIGURATION"],
                    type = "group",
                    inline = true,
                    order = 2,
                    disabled = function() 
                        return not Vendormatic.db.profile.Settings.General.Repair.Enabled 
                    end,
                    args = {
                        CHECKBOX_VENDORMATIC_GUILDREPAIR = {
                            type = 'toggle',
                            order = 1,
                            name = L["OPTIONS/GUILDREPAIR/ENABLED"],
                            desc = L["OPTIONS/GUILDREPAIR/ENABLED/DESCRIPTION"],
                            set = function(info, val) 
                                if (val) then 
                                    Vendormatic.db.profile.Settings.General.Repair.PreferGuild = true 
                                else Vendormatic.db.profile.Settings.General.Repair.PreferGuild = false 
                                end 
                            end,
                            get = function(info) 
                                return Vendormatic.db.profile.Settings.General.Repair.PreferGuild 
                            end,
                            width = 'full',
                        },
                    }
                },
            }
        },
        HEADER_OUTPUT = {
            name = L["OPTIONS/GROUP/OUTPUT"],
            desc = L["OPTIONS/GROUP/OUTPUT"],
            type = "group",
            inline = true,
            order = 4,
            args = {
                DROPDOWN_VENDORMATIC_OUTPUTLEVEL = {
                    type = 'select',
                    order = 1,
                    name = L["OPTIONS/OUTPUT/OUTPUTLEVEL"],
                    desc = L["OPTIONS/OUTPUT/OUTPUTLEVEL/DESCRIPTION"],
                    values = {
                        Minimal = L["OPTIONS/OUTPUT/OUTPUTLEVEL/MINIMAL"],
                        All = L["OPTIONS/OUTPUT/OUTPUTLEVEL/FULL"],
                    },
                    set = function(info, val) 
                        Vendormatic.db.profile.Settings.General.Output = val 
                    end,
                    get = function(info)
                        return Vendormatic.db.profile.Settings.General.Output
                    end,
                },
            },
        }  
    },
}

Vendormatic.Blacklist = {

    name = "Blacklist",
    handler = Blacklist,
    type = 'group',
    args = {
          
    },
}