local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()
local Window = OrionLib:MakeWindow({Name = "FlightWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "FlightWare", IntroIcon = "rbxassetid://30394484"})

local CombatTab = Window:MakeTab({
	Name = "Combat",
	Icon = "rbxassetid://7072715317",
	PremiumOnly = false
})

local RenderTab = Window:MakeTab({
	Name = "Render",
	Icon = "rbxassetid://7072716095",
	PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://7072724538",
	PremiumOnly = false
})

local WorldTab = Window:MakeTab({
	Name = "World",
	Icon = "rbxassetid://7072718576",
	PremiumOnly = false
})

local ChatSpammerTab = Window:MakeTab({
	Name = "Chat Spammer",
	Icon = "rbxassetid://7072718943",
	PremiumOnly = false
})

local MiningClickerTab = Window:MakeTab({
	Name = "Mining Clicker",
	Icon = "rbxassetid://7072719587",
	PremiumOnly = false
})

local DarkLifeTab = Window:MakeTab({
	Name = "Dark Life",
	Icon = "rbxassetid://7072718776",
	PremiumOnly = false
})

local StockRiseTab = Window:MakeTab({
	Name = "StockRise",
	Icon = "rbxassetid://7072723932",
	PremiumOnly = false
})

local ArsenalTab = Window:MakeTab({
	Name = "Arsenal",
	Icon = "rbxassetid://7072715317",
	PremiumOnly = false
})

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://7072721682",
	PremiumOnly = false
})



--Render

RenderTab:AddSlider({
	Name = "FOV",
	Min = math.floor(workspace.CurrentCamera.FieldOfView),
	Max = 120,
	Default = 20,
	Color = Color3.fromRGB(237,141,156),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		workspace.CurrentCamera.FieldOfView = Value
	end    
})



--End of Render



--Player Tab
PlayerTab:AddSlider({
	Name = "Walk Speed",
	Min = 20,
	Max = 100,
	Default = 20,
	Color = Color3.fromRGB(237,141,156),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

PlayerTab:AddSlider({
	Name = "Jump Height",
	Min = 50,
	Max = 200,
	Default = 20,
	Color = Color3.fromRGB(240,162,103),
	Increment = 1,
	ValueName = "meters",
	Callback = function(Value)
		game:GetService('Players').LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

PlayerTab:AddSlider({
	Name = "Hip Height",
	Min = 2,
	Max = 20,
	Default = 2,
	Color = Color3.fromRGB(237,141,156),
	Increment = 1,
	ValueName = "length",
	Callback = function(Value)
		game:GetService('Players').LocalPlayer.Character.Humanoid.HipHeight = Value
	end    
})

PlayerTab:AddToggle({
	Name = "Freeze",
	Default = false,
	Callback = function(Value)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = Value
	end    
})


PlayerTab:AddToggle({
	Name = "Sit",
	Default = false,
	Callback = function(Value)
        game:GetService('Players').LocalPlayer.Character.Humanoid.Sit = Value
	end    
})


PlayerTab:AddButton({
	Name = "Anti-AFK",
	Callback = function()
      		local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
	end    
})

PlayerTab:AddButton({
	Name = "Reset",
	Callback = function()
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
	end    
})

--World



--End of World



--Chat Spammer

--Values
getgenv().chatSpammer = true

--Functions
function chatSpammer()
    while getgenv().chatSpammer == true do
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().textToSpamChatSpammer,"All")
   wait(getgenv().delayChatSpammer)
    end
end

ChatSpammerTab:AddToggle({
	Name = "Chat Spammer",
	Default = false,
	Callback = function(Value)
		getgenv().chatSpammer = Value
        chatSpammer()
	end    
})

ChatSpammerTab:AddTextbox({
	Name = "Text To Spam",
	Default = "Get FlightWare at: razed.tk",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().textToSpamChatSpammer = Value
	end	  
})

ChatSpammerTab:AddSlider({
	Name = "Delay",
	Min = 0,
	Max = 5,
	Default = 2,
	Color = Color3.fromRGB(237,141,156),
	Increment = 0.50,
	ValueName = "ms",
	Callback = function(Value)
		getgenv().delayChatSpammer = Value
	end    
})


--End of Chat Spammer


--Mining Clicker

--Values
getgenv().autoClickMiningClicker = true

getgenv().autoRebirthMiningClicker = true

getgenv().autoBoostMiningClicker = true

getgenv().selectBoostMiningClicker = "Luck Boost"

getgenv().autoEggMiningClicker = true

getgenv().selectEggMiningClicker = "Starter Egg"


--Functions
function autoClickMiningClicker()
    while getgenv().autoClickMiningClicker == true do
   game:GetService("ReplicatedStorage").Remotes.Click:InvokeServer()
   wait(0.00000000000000000000000000000000000000000000000000000000000000000000001)
    end
end

function autoRebirthMiningClicker()
        while getgenv().autoRebirthMiningClicker == true do
   game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
      wait(3)
    end
end

function autoBoostMiningClicker()
	while getgenv().autoBoostMiningClicker == true do
		game:GetService("ReplicatedStorage").Remotes.fireBoostUse:FireServer(getgenv().selectBoostMiningClicker)
		wait(getgenv().delayBoostMiningClicker)
	  end
end

function autoEggMiningClicker()
	while getgenv().autoEggMiningClicker == true do
		game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(getgenv().selectEggMiningClicker, 1)
		wait(getgenv().delayEggMiningClicker)
	  end
end

--Modules

MiningClickerTab:AddLabel("General")

MiningClickerTab:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
        getgenv().autoClickMiningClicker = Value
        autoClickMiningClicker()
	end
})

	MiningClickerTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
        getgenv().autoRebirthMiningClicker = Value
        autoRebirthMiningClicker()
	end
})


	MiningClickerTab:AddLabel("Eggs")

	MiningClickerTab:AddToggle({
		Name = "Auto Egg",
		Default = false,
		Callback = function(Value)
			getgenv().autoEggMiningClicker = Value
			autoEggMiningClicker()
		end
		})
		
		MiningClickerTab:AddDropdown({
			Name = "Select Egg",
			Default = "Starter Egg",
			Options = {"Starter Egg", "Spotted Egg", "Floral Egg"},
			Callback = function(Value)
				getgenv().selectEggMiningClicker = Value
				print(getgenv().selectEggMiningClicker)
			end    
		})

		MiningClickerTab:AddSlider({
			Name = "Delay",
			Min = 0.1,
			Max = 20,
			Default = 1,
			Color = Color3.fromRGB(237,141,156),
			Increment = 1,
			ValueName = "seconds",
			Callback = function(Value)
				getgenv().delayEggMiningClicker = Value
			end    
		})

	MiningClickerTab:AddLabel("Boosts")


	MiningClickerTab:AddToggle({
	Name = "Auto Boost",
	Default = false,
	Callback = function(Value)
		getgenv().autoBoostMiningClicker = Value
		autoBoostMiningClicker()
	end
	})
	
	MiningClickerTab:AddDropdown({
		Name = "Select Boost",
		Default = "Luck Boost",
		Options = {"Luck Boost", "Super Luck Boost", "Triple Coins Boost"},
		Callback = function(Value)
			getgenv().selectBoostMiningClicker = Value
			print(getgenv().selectBoostMiningClicker)
		end    
	})
	
	MiningClickerTab:AddSlider({
		Name = "Delay",
		Min = 0.1,
		Max = 20,
		Default = 1,
		Color = Color3.fromRGB(240,162,103),
		Increment = 1,
		ValueName = "seconds",
		Callback = function(Value)
			getgenv().delayBoostMiningClicker = Value
		end    
	})

	MiningClickerTab:AddLabel("Misc")

MiningClickerTab:AddButton({
	Name = "Pet Animation",
	Callback = function()
	game:GetService("ReplicatedStorage").Remotes.animHandleForPets:FireServer(false,{{["_OrientationAttachment"] = workspace.KathyLarsen1.HumanoidRootPart.Attachment,["_IsIdle"] = true,["MainPart"] = workspace.Pets.Sheep.HumanoidRootPart,["_Attachment"] = workspace.Pets.Sheep.HumanoidRootPart.Attachment,["_BodyPosition"] = workspace.Pets.Sheep.HumanoidRootPart.BodyPosition,["_IsAttacking"] = false,["_AlignOrientation"] = workspace.Pets.Sheep.HumanoidRootPart.AlignOrientation,["Model"] = workspace.Pets.Sheep,["ID"] = "{1612a402-dda9-423a-b001-79d1cc55f640}",["_Connections"] = {}},{["_OrientationAttachment"] = workspace.KathyLarsen1.HumanoidRootPart.Attachment,["_IsIdle"] = true,["MainPart"] = workspace.Pets.Pig.HumanoidRootPart,["_Attachment"] = workspace.Pets.Pig.HumanoidRootPart.Attachment,["_BodyPosition"] = workspace.Pets.Pig.HumanoidRootPart.BodyPosition,["_IsAttacking"] = false,["_AlignOrientation"] = workspace.Pets.Pig.HumanoidRootPart.AlignOrientation,["Model"] = workspace.Pets.Pig,["ID"] = "{6f837371-719d-4a10-a7a7-9d0f433c9dde}",["_Connections"] = {}},{["_OrientationAttachment"] = workspace.KathyLarsen1.HumanoidRootPart.Attachment,["_IsIdle"] = true,["MainPart"] = workspace.Pets.Dog.HumanoidRootPart,["_Attachment"] = workspace.Pets.Dog.HumanoidRootPart.Attachment,["_BodyPosition"] = workspace.Pets.Dog.HumanoidRootPart.BodyPosition,["_IsAttacking"] = false,["_AlignOrientation"] = workspace.Pets.Dog.HumanoidRootPart.AlignOrientation,["Model"] = workspace.Pets.Dog,["ID"] = "{caa07ba5-cf0f-4fec-9c6c-d30ce5e5193b}",["_Connections"] = {}}})  	end    
})

--End of Mining Clicker

--Dark Life

--Values
getgenv().autoClickClickerSimulator = true

getgenv().selectGunDarkLife = "Pistol"

getgenv().selectArmorDarkLife = "100 Armor"

--Functions
function autoClickClickerSimulator()
    while getgenv().autoClickClickerSimulator == true do
		game:GetService("ReplicatedStorage").Wallet.DropMoney:FireServer(100)
		wait(0.1)
    end
end


DarkLifeTab:AddLabel("Money")


DarkLifeTab:AddButton({
	Name = "Drop Money",
	Callback = function()
		game:GetService("ReplicatedStorage").Wallet.DropMoney:FireServer(getgenv().moneyToDropDarkLife)
  	end    
})

DarkLifeTab:AddTextbox({
	Name = "Amount Of Money",
	Default = "100",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().moneyToDropDarkLife = Value
	end	  
})

DarkLifeTab:AddLabel("Guns")

DarkLifeTab:AddDropdown({
	Name = "Select Gun",
	Default = "Pistol",
	Options = {"Pistol", "SMG", "P-90", "Shotgun", "AK-74", "Crossbow", "Sniper", "Barret", "Grenade Launcher", "Cannon", "Rocket Launcher", "One Shot Glock", "Gaster Blaster"},
	Callback = function(Value)
		getgenv().selectGunDarkLife = Value
		print(getgenv().selectGunDarkLife)
	end    
})

DarkLifeTab:AddButton({
	Name = "Buy Gun",
	Callback = function()
		game:GetService("ReplicatedStorage").VendingMachine.TryPurchaseGun:InvokeServer(getgenv().selectGunDarkLife,workspace["Weapon vending machine"])
  	end    
})

DarkLifeTab:AddLabel("Armor")

DarkLifeTab:AddDropdown({
	Name = "Select Armor",
	Default = "100 Armor",
	Options = {"100 Armor", "150 Armor", "200 Armor"},
	Callback = function(Value)
		getgenv().selectArmorDarkLife = Value
		print(getgenv().selectArmorDarkLife)
	end    
})

DarkLifeTab:AddButton({
	Name = "Buy Armor",
	Callback = function()
		game:GetService("ReplicatedStorage").VendingMachine.TryPurchaseArmor:InvokeServer(getgenv().selectArmorDarkLife,workspace["Armor vending machine"])
  	end    
})

--End Of Dark Life

--StockRise

-- Values
getgenv().selectArmorDarkLife = "CRYPTOSOON"

StockRiseTab:AddLabel("Codes")

StockRiseTab:AddDropdown({
	Name = "Select Code",
	Default = "CRYPTOSOON",
	Options = {"CRYPTOSOON", "idk", "idk"},
	Callback = function(Value)
		getgenv().selectCodeStockRise = Value
		print(getgenv().selectCodeStockRise)
	end    
})

StockRiseTab:AddButton({
	Name = "Redeem Code",
	Callback = function()
		print("**THIS IS A BYPASS** --- SUCCESSFULLY USED CODES!")
		game:GetService("ReplicatedStorage").GameplayEvents.Twitter.CheckCode:InvokeServer(getgenv().selectCodeStockRise)
  	end    
})
--End of StockRise

--Arsenal

ArsenalTab:AddButton({
	Name = "Aimbot",
	Callback = function()
		print("**THIS IS A BYPASS** --- SUCCESSFULLY USED CODES!")
		loadstring(game:HttpGet(('https://pastebin.com/raw/E70uc3Kk')))()
  	end    
})

--End of Arsenal



--Settings




SettingsTab:AddColorpicker({
	Name = "Color Scheme",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		getgenv().ColorScheme = Value
	end	  
})


--End Of Settings



OrionLib:Init()
