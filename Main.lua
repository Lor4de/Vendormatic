Vendormatic = LibStub("AceAddon-3.0"):GetAddon("Vendormatic")
local L = LibStub("AceLocale-3.0"):GetLocale("Vendormatic")

Vendormatic.SellBlacklist = {
	[193201] = true,
	[191251] = true,
}

Vendormatic.FortuneCards = {
    [62590] = true, --FortuneCard
	[60845] = true, --FortuneCard
	[62606] = true, --FortuneCard
	[60842] = true, --FortuneCard
	[60841] = true, --FortuneCard
	[62602] = true, --FortuneCard
	[62603] = true, --FortuneCard
	[62604] = true, --FortuneCard
	[62605] = true, --FortuneCard
	[60839] = true, --FortuneCard
	[62598] = true, --FortuneCard
	[62599] = true, --FortuneCard
	[62600] = true, --FortuneCard
	[62601] = true, --FortuneCard
	[62246] = true, --FortuneCard
	[62577] = true, --FortuneCard
	[62578] = true, --FortuneCard
	[62579] = true, --FortuneCard
	[62580] = true, --FortuneCard
	[62581] = true, --FortuneCard
	[62582] = true, --FortuneCard
	[62583] = true, --FortuneCard
	[62584] = true, --FortuneCard
	[62585] = true, --FortuneCard
	[62586] = true, --FortuneCard
	[62587] = true, --FortuneCard
	[62588] = true, --FortuneCard
	[62589] = true, --FortuneCard
	[60843] = true, --FortuneCard
	[62591] = true, --FortuneCard
	[62247] = true, --FortuneCard
	[62552] = true, --FortuneCard
	[62553] = true, --FortuneCard
	[62554] = true, --FortuneCard
	[62555] = true, --FortuneCard
	[62556] = true, --FortuneCard
	[62557] = true, --FortuneCard
	[62558] = true, --FortuneCard
	[62559] = true, --FortuneCard
	[62560] = true, --FortuneCard
	[62561] = true, --FortuneCard
	[62562] = true, --FortuneCard
	[62563] = true, --FortuneCard
	[62564] = true, --FortuneCard
	[62565] = true, --FortuneCard
	[62566] = true, --FortuneCard
	[62567] = true, --FortuneCard
	[62568] = true, --FortuneCard
	[62569] = true, --FortuneCard
	[62570] = true, --FortuneCard
	[62571] = true, --FortuneCard
	[62572] = true, --FortuneCard
	[62573] = true, --FortuneCard
	[62574] = true, --FortuneCard
	[62575] = true, --FortuneCard
	[62576] = true, --FortuneCard
}

Vendormatic.UnusableItemTypes = {
	['DEATHKNIGHT'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Warglaive },
	},
	['DEMONHUNTER'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Mace1H },
	},
	['DRUID'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Warglaive },
	},
	['HUNTER'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Warglaive },
	},
	['MAGE'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield  },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Warglaive },
	},
	['MONK'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Warglaive },
	},
	['PALADIN'] = {
		[Enum.ItemClass.Armor] = { },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Dagger, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Warglaive },
	},
	['PRIEST'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Warglaive },
	},
	['ROGUE'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Staff, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Warglaive },
	},
	['SHAMAN'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Plate },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword1H, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Warglaive },
	},
	['WARLOCK'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Leather, Enum.ItemArmorSubclass.Mail, Enum.ItemArmorSubclass.Plate, Enum.ItemArmorSubclass.Shield },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Axe1H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Mace1H, Enum.ItemWeaponSubclass.Mace2H, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Unarmed, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Warglaive },
	},
	['WARRIOR'] = {
		[Enum.ItemClass.Armor] = { },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Warglaive },
	},
	['EVOKER'] = {
		[Enum.ItemClass.Armor] = { Enum.ItemArmorSubclass.Plate },
		[Enum.ItemClass.Weapon] = { Enum.ItemWeaponSubclass.Wand, Enum.ItemWeaponSubclass.Bows, Enum.ItemWeaponSubclass.Guns, Enum.ItemWeaponSubclass.Crossbow, Enum.ItemWeaponSubclass.Thrown, Enum.ItemWeaponSubclass.Warglaive, Enum.ItemWeaponSubclass.Polearm, Enum.ItemWeaponSubclass.Sword2H, Enum.ItemWeaponSubclass.Axe2H, Enum.ItemWeaponSubclass.Mace2H},
	},
}

Vendormatic.Quality = {
    ["a"] = 0,
    ["b"] = 1, 
    ["c"] = 2, 
    ["d"] = 3, 
    ["e"] = 4,
    ["f"] = 5,
    ["g"] = 6,
    ["h"] = 7, 
    ["i"] = 8
}

function Vendormatic:OnEnable()
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("MERCHANT_CLOSED")

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Vendormatic", self.Options)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("Vendormatic.profiles", profiles)
	--LibStub("AceConfig-3.0"):RegisterOptionsTable("Vendormatic.blacklist", self.Blacklist)

	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Vendormatic", "Vendormatic")
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Vendormatic.profiles", "Profiles", "Vendormatic")
	--LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Vendormatic.blacklist", "Blacklist", "Vendormatic")

	self:RegisterChatCommand("vm", "ToggleAddonOptions")
	self:RegisterChatCommand("vendormatic", "ToggleAddonOptions")
	self:RegisterChatCommand("simulateselling", "SimulateSelling")

    self.Variables.PlayerClass = self:GetPlayerClass()
end

function Vendormatic:OnDisable()
  self:UnregisterEvent("MERCHANT_SHOW")
  self:UnregisterEvent("MERCHANT_CLOSED")
end

function Vendormatic:MERCHANT_SHOW()

	if self.db.profile.Settings.General.Repair.Enabled == true then
		self:Repair()
	end

	if self.db.profile.Settings.General.Sell.Enabled == true then
		if self:GetAddonGameVersion() > 100000 then
			self:Sell(false)
		else
			self:SellDeprecated(false)
		end
	end

end

function Vendormatic:MERCHANT_CLOSED()

	if self.Variables.SendSoldItemsMessage == true then

		if self.Variables.SumMoneyEarned > 0 then
			if Simulate == true then
				self:Print(string.format("Simulation: "..L["OUTPUT/ALLITEMSSOLDFOR"], self.Variables.ItemsSold, self:GetMoneyString(self.Variables.SumMoneyEarned, true)))
			else
				self:Print(string.format(L["OUTPUT/ALLITEMSSOLDFOR"], self.Variables.ItemsSold, self:GetMoneyString(self.Variables.SumMoneyEarned, true)))
			end
		else
			if Simulate == true then
				self:Print(string.format("Simulation: "..L["OUTPUT/NOTHINGTOSELL"]))
			else
				self:Print(string.format(L["OUTPUT/NOTHINGTOSELL"]))
			end
		end

		self.Variables.ItemsSold = 0
		self.Variables.SumMoneyEarned = 0
		self.Variables.SendSoldItemsMessage = false
	end

end

function Vendormatic:SimulateSelling()
	if self:GetAddonGameVersion() > 100000 then
		self:Sell(true)
	else
		self:SellDeprecated(true)
	end
end

function Vendormatic:Repair()

	if CanMerchantRepair() == true then

		local RepairCost, PlayerCanRepair = GetRepairAllCost()

		if PlayerCanRepair == true then

			local UseGuildBankMoney = false

			if CanGuildBankRepair() == true and self.db.profile.Settings.General.Repair.PreferGuild == true then
                if GetGuildBankWithdrawMoney() > RepairCost then
				    UseGuildBankMoney = true
                end
			end

			RepairAllItems(UseGuildBankMoney)

			local RepairCostMoneyString = self:GetMoneyString(RepairCost, true)

			self:Print(string.format(L["OUTPUT/ALLITEMSREPAIREDFOR"], RepairCostMoneyString))

		end
	end
end

function Vendormatic:Sell(Simulate)

	local SellingList = {}

	for Bag = 0, 4 do

		SellingList[Bag] = {}

		for Slot = 1, C_Container.GetContainerNumSlots(Bag) do

			local ItemLink = C_Container.GetContainerItemLink(Bag, Slot)

			if ItemLink ~= nil then

				local ItemCount = C_Container.GetContainerItemInfo(Bag, Slot).stackCount
                local ItemPrice = self:GetItemPrice(ItemLink)

                if ItemPrice ~= nil then
					if ItemPrice > 0 then

						local CanSellItem, SellCriteria = self:DoesSellCriteriaMatch(ItemLink)

						if CanSellItem == true then

							self.Variables.SumMoneyEarned = self.Variables.SumMoneyEarned + (ItemPrice * ItemCount)
							self.Variables.ItemsSold = self.Variables.ItemsSold + 1
							
							table.insert(SellingList[Bag], Slot)

							if self.db.profile.Settings.General.Debug == true then
								self:Print(string.format(L["OUTPUT/SOLDITEMFORCRITERIA"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true), SellCriteria))
							end
						else
							if self.db.profile.Settings.General.Debug == true then
								self:Print(string.format(L["OUTPUT/SKIPITEMCRITERIA"], ItemLink, SellCriteria))	
							end
						end
					end
                end
			
			end

		end
	end

	local TotalSoldItems = 0

	for BagIndex, Bag in pairs(SellingList) do

		local ItemsInCurrentBag = table.getn(SellingList[BagIndex])
		TotalSoldItems = TotalSoldItems + ItemsInCurrentBag

		if ItemsInCurrentBag > 0 then

			local SlotIndex = 1

			C_Timer.NewTicker(self.db.profile.Settings.General.Sell.SellingDelay, function()

				local BagSlotIndex = Bag[SlotIndex]
				local ItemLink = C_Container.GetContainerItemLink(BagIndex, BagSlotIndex)

				if ItemLink ~= nil then

					local ItemCount = C_Container.GetContainerItemInfo(BagIndex, BagSlotIndex).stackCount
					local ItemPrice = self:GetItemPrice(ItemLink)

					if Simulate == false then
						C_Container.UseContainerItem(BagIndex, BagSlotIndex)
					end

					if self.db.profile.Settings.General.Output == "All" or Simulate == true then
						if Simulate == true then
							self:Print(string.format("Simulation: "..L["OUTPUT/SOLDITEMFOR"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true)))
						else
							self:Print(string.format(L["OUTPUT/SOLDITEMFOR"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true)))
						end
					end

					SlotIndex = SlotIndex + 1
				
				end

			end, ItemsInCurrentBag)
		end
	end

	self.Variables.SendSoldItemsMessage = true

	if Simulate == true then
		C_Timer.After(TotalSoldItems * self.db.profile.Settings.General.Sell.SellingDelay + self.db.profile.Settings.General.Sell.SellingDelay, function() 
			self:MERCHANT_CLOSED()
		end)
	end
end

function Vendormatic:SellDeprecated(Simulate)

	local SellingList = {}

	for Bag = 0, 4 do

		SellingList[Bag] = {}

		for Slot = 1, GetContainerNumSlots(Bag) do

			local ItemLink = GetContainerItemLink(Bag, Slot)

			if ItemLink ~= nil then

				local ItemCount = select(2, GetContainerItemInfo(Bag, Slot))
                local ItemPrice = self:GetItemPrice(ItemLink)

                if ItemPrice ~= nil then
					if ItemPrice > 0 then

						local CanSellItem, SellCriteria = self:DoesSellCriteriaMatch(ItemLink)

						if CanSellItem == true then

							self.Variables.SumMoneyEarned = self.Variables.SumMoneyEarned + (ItemPrice * ItemCount)
							self.Variables.ItemsSold = self.Variables.ItemsSold + 1
							
							table.insert(SellingList[Bag], Slot)

							if self.db.profile.Settings.General.Debug == true then
								self:Print(string.format(L["OUTPUT/SOLDITEMFORCRITERIA"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true), SellCriteria))
							end
						else
							if self.db.profile.Settings.General.Debug == true then
								self:Print(string.format(L["OUTPUT/SKIPITEMCRITERIA"], ItemLink, SellCriteria))	
							end
						end
					end
                end
			
			end

		end
	end

	local TotalSoldItems = 0

	for BagIndex, Bag in pairs(SellingList) do

		local ItemsInCurrentBag = table.getn(SellingList[BagIndex])
		TotalSoldItems = TotalSoldItems + ItemsInCurrentBag

		if ItemsInCurrentBag > 0 then

			local SlotIndex = 1

			C_Timer.NewTicker(self.db.profile.Settings.General.Sell.SellingDelay, function()

				local BagSlotIndex = Bag[SlotIndex]
				local ItemLink = GetContainerItemLink(BagIndex, BagSlotIndex)

				if ItemLink ~= nil then

					local ItemCount = select(2, GetContainerItemInfo(BagIndex, BagSlotIndex))
					local ItemPrice = self:GetItemPrice(ItemLink)

					if Simulate == false then
						UseContainerItem(BagIndex, BagSlotIndex)
					end

					if self.db.profile.Settings.General.Output == "All" or Simulate == true then
						if Simulate == true then
							self:Print(string.format("Simulation: "..L["OUTPUT/SOLDITEMFOR"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true)))
						else
							self:Print(string.format(L["OUTPUT/SOLDITEMFOR"], ItemCount, ItemLink, self:GetMoneyString(ItemPrice * ItemCount, true)))
						end
					end

					SlotIndex = SlotIndex + 1
				
				end

			end, ItemsInCurrentBag)
		end
	end

	self.Variables.SendSoldItemsMessage = true

	if Simulate == true then
		C_Timer.After(TotalSoldItems * self.db.profile.Settings.General.Sell.SellingDelay + self.db.profile.Settings.General.Sell.SellingDelay, function() 
			self:MERCHANT_CLOSED()
		end)
	end
end