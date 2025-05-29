Vendormatic = LibStub("AceAddon-3.0"):NewAddon("Vendormatic", "AceConsole-3.0", "AceEvent-3.0")
Vendormatic.AceConfig = LibStub("AceConfig-3.0")
Vendormatic.AceConfigDialog = LibStub("AceConfigDialog-3.0")

function Vendormatic:OnInitialize()

	local Defaults = {
        profile = {
            Settings = {
                General = {
					Enabled	= true,
					Debug = false, 
					Output = "All",
					Repair = {
						Enabled = true,
						PreferGuild = false, 
					},
					Sell = {
						Enabled = true,
						ExcludeBoe = true,
						SellFortuneCardsAlways = false,
						SellItemsBelowQuality = true, 
						SellItemsBelowQualityValue = 0,
						SellItemsBelowItemLevel = false, 
						SellItemsBelowItemLevelValue = 200,
						SellItemsBelowPrice = false, 
						SellItemsBlowPriceValue = 100000,
						SellItemsUnusableByPlayer = false,
						SellingDelay = 0.5,
					}
                },
            },
			UserBlacklist = {

			},
        },
	}

	self.Variables = {
		ItemsSold = 0,
		SumMoneyEarned = 0,
		SendSoldItemsMessage = false,
	}

	self.db = LibStub("AceDB-3.0"):New("VendormaticDB", Defaults, "Default")
end