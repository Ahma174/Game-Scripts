if game.PlaceId == 104753750317341 then
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local ms = game:GetService("MarketplaceService") -- needed for the game name

-- Important Variables to make the script function
local Event = game:GetService("Players").LocalPlayer.muscleEvent
local ocr = game:GetService("ReplicatedStorage").rEvents.openCrystalRemote
local sas = game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote
local reb = game:GetService("ReplicatedStorage").rEvents.rebirthRemote
local v = false
local v1 = false
local SelectedC = "Blue Crystal"
local v2 = false

-- Paths
local rt = game:GetService("Players").LocalPlayer.RebirthTokens
local t = game:GetService("Players").LocalPlayer.Tokens
local g = game:GetService("Players").LocalPlayer.Gems
local dur = game:GetService("Players").LocalPlayer.Durability
local ag = game:GetService("Players").LocalPlayer.Agility
local autor = game:GetService("Players").LocalPlayer.autoRebirthEnabled
local mon = game:GetService("Players").LocalPlayer.musicOn
local tron = game:GetService("Players").LocalPlayer.tradingOn

-- chests
local lc = workspace.legendsChest.circleInner
local gc = workspace.goldenChest.circleInner
local gr = workspace.groupRewardsCircle.circleInner
local ec = workspace.enchantedChest.circleInner
local mc = workspace.magmaChest.circleInner
local mc2 = workspace.mythicalChest.circleInner

-- general
local function hrp()
  return game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
end

local Window = WindUI:CreateWindow({
    Title = "Average Script Hub | ".. ms:GetProductInfo(game.PlaceId).Name,
    Author = "Made By Sjjsksjsnnnsns, Made With WindUI",
    Icon = "solar:wind-bold",
    Folder = "WindUIExample",
    Size = UDim2.fromOffset(620, 500),
    Theme = "Dark",
    Resizable = true,
})

local Main = Window:Tab({
    Title = "Main",
    Icon = "layers",
})

Main:Section({
    Title = "Main Section",
    Desc = "Main Section For Important stuff",
})

Main:Toggle({
    Title = "Auto Rep",
    Desc = "Turns On/Off Auto Rep (Doesnt Work With Machines)",
    Value = false,
    Callback = function(value)
        v = value
        
        if v then
         task.spawn(function()
          while v do
           Event:FireServer("rep")
           task.wait(0.07)
          end
         end)
        end
    end,
})

Main:Toggle({
    Title = "Auto Punch",
    Desc = "Turns On/Off Auto Punch",
    Value = false,
    Callback = function(value)
        v1 = value
        
        if v1 then
         task.spawn(function()
          while v1 do
           Event:FireServer("punch", "leftHand")
           task.wait(0.07)
           Event:FireServer("punch", "rightHand")
           task.wait(0.07)
          end
         end)
        end
 end,
})

Main:Toggle({
    Title = "Auto Rebirth",
    Desc = "Turns On/Off Auto Rebirth",
    Value = false,
    Callback = function(value)
       if value == true then
        autor = true
       else
        autor = false
       end
 end,
})

Main:Button({
    Title = "Rebirth",
    Desc = "Manual Rebirth",
    Icon = "mouse-pointer",
    Callback = function()
        reb:InvokeServer("rebirthRequest")
    end,
})

local Pets = Window:Tab({
    Title = "Pets",
    Icon = "layers",
})

Pets:Section({
    Title = "Pets Section",
    Desc = "Pets Section For Pet Opening",
})

Pets:Dropdown({
    Title = "Select Pet Crystal",
    Desc = "Pick A Crystal",
    Values = {
        "Blue Crystal", 
        "Battle Legends Crystal", 
        "Dark Nebula Crystal", 
        "Frost Crystal", 
        "Galaxy Oracle Crystal", 
        "Green Crystal", 
        "Inferno Crystal",
        "Legends Crystal", 
        "Muscle Elite Crystal", 
        "Mythical Crystal", 
        "Ultra Shockwave Crystal"
    },
    Value = "Blue Crystal",
    Callback = function(value)
        SelectedC = value
    end,
})

Pets:Input({
    Title = "Open By Number",
    Desc = "Enter A Number to Open The Crystal",
    Placeholder = "Type here...",
    Callback = function(value)
       for i = 1, tonumber(value) do
         ocr:InvokeServer("openCrystal", SelectedC)
       end
    end,
})

Pets:Toggle({
    Title = "Auto Open Crystal",
    Desc = "Auto Opens Selected Crystals",
    Value = false,
    Callback = function(value)
      v2 = value
      
      if v2 then
       task.spawn(function()
        while v2 do
         ocr:InvokeServer("openCrystal", SelectedC)
         task.wait(0.07)
        end
       end)
      end
 end,
})

Pets:Button({
    Title = "Open Crystal",
    Desc = "Open Crystals Manually",
    Icon = "mouse-pointer",
    Callback = function()
        ocr:InvokeServer("openCrystal", SelectedC)
    end,
})

local Misc = Window:Tab({
    Title = "Misc",
    Icon = "layers",
})

Misc:Section({
    Title = "Misc Section",
    Desc = "Misc Section For Miscellaneous stuff",
})

Misc:Input({
    Title = "Type Agility Value",
    Desc = "Enter A Number to Change The Agility",
    Placeholder = "Type here...",
    Callback = function(value)
       ag.Value = value
    end,
})

Misc:Input({
    Title = "Type Durability Value",
    Desc = "Enter A Number to Change The Durability",
    Placeholder = "Type here...",
    Callback = function(value)
       dur.Value = value
    end,
})

Misc:Input({
    Title = "Type Token Value",
    Desc = "Enter A Number to Change The Tokens",
    Placeholder = "Type here...",
    Callback = function(value)
       t.Value = value
    end,
})

Misc:Input({
    Title = "Type Gems Value",
    Desc = "Enter A Number to Change The Gems",
    Placeholder = "Type here...",
    Callback = function(value)
       g.Value = value
    end,
})

Misc:Input({
    Title = "Type Rebirth Tokens Value",
    Desc = "Enter A Number to Change The Rebirth Tokens",
    Placeholder = "Type here...",
    Callback = function(value)
       rt.Value = value
    end,
})

Misc:Section({
    Title = "Trading/Music Section",
    Desc = "Section For Music/Trading Related Things",
})

Misc:Toggle({
    Title = "Trading On/Off",
    Desc = "Turn Trading On/Off",
    Value = false,
    Callback = function(value)
      if value == true then
       tron.Value = false
      else
       tron.Value = true
      end
 end,
})

Misc:Button({
    Title = "Change Music",
    Desc = "Click The Button To Change The Music",
    Icon = "mouse-pointer",
    Callback = function()
        local musicFolder = workspace:WaitForChild("musicFolder")
local v1
local currentMap = game.Players.LocalPlayer:WaitForChild("currentMap")
local u4

local function u4_2(v2)
    local v3 = musicFolder:FindFirstChild(v2)
    if v3 ~= nil then
        local v4 = v3:GetChildren()[math.random(1, #v3:GetChildren())]
        if v4 ~= nil then
            for v5, v6 in pairs(musicFolder:GetDescendants()) do
                if v6 ~= nil and v6:IsA("Sound") then
                    v6:Pause()
                end
            end
            if v1 ~= nil then
                v1:Disconnect()
            end
            local v7
            if v4.Parent == nil then
                v7 = true
            elseif v4.Parent.Name == "Boxing Ring" or v4.Parent.Name == "Desert Ring" then
                v7 = false
            else
                v7 = v4.Parent.Name ~= "Magma Ring"
            end
            if v7 == true then
                v4:Resume()
            else
                v4:Play()
            end
            v1 = v4.Ended:Connect(function()
                v1:Disconnect()
                u4(currentMap.Value)
            end)
        end
    end
end

u4 = u4_2
u4_2(currentMap.Value)
currentMap.Changed:Connect(function()
    u4_2(currentMap.Value)
end)
    end,
})

Misc:Section({
    Title = "Speed/Size Section",
    Desc = "Section For Speed/Size Related Things",
})

Misc:Input({
    Title = "Type Size Value",
    Desc = "Enter A Number to Change The Size",
    Placeholder = "Type here...",
    Callback = function(value)
       sas:InvokeServer("changeSize", tonumber(value))
    end,
})

Misc:Input({
    Title = "Type Speed Value",
    Desc = "Enter A Number to Change The Speed",
    Placeholder = "Type here...",
    Callback = function(value)
       sas:InvokeServer("changeSpeed", tonumber(value))
    end,
})

local Chests = Window:Tab({
    Title = "Chests",
    Icon = "layers",
})

Chests:Button({
    Title = "Open Legends Chest",
    Desc = "Click The Button To Open The Legends Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(lc, hrp, 0)
       task.wait()
       firetouchinterest(lc, hrp, 1)
    end,
})

Chests:Button({
    Title = "Open Golden Chest",
    Desc = "Click The Button To Open The Golden Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(gc, hrp, 0)
       task.wait()
       firetouchinterest(gc, hrp, 1)
    end,
})

Chests:Button({
    Title = "Open Group Chest",
    Desc = "Click The Button To Open The Group Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(gr, hrp, 0)
       task.wait()
       firetouchinterest(gr, hrp, 1)
    end,
})

Chests:Button({
    Title = "Open Enchanted Chest",
    Desc = "Click The Button To Open The Enchanted Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(ec, hrp, 0)
       task.wait()
       firetouchinterest(ec, hrp, 1)
    end,
})

Chests:Button({
    Title = "Open Magma Chest",
    Desc = "Click The Button To Open The Magma Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(mc, hrp, 0)
       task.wait()
       firetouchinterest(mc, hrp, 1)
    end,
})

Chests:Button({
    Title = "Open Mythical Chest",
    Desc = "Click The Button To Open The Mythical Chest",
    Icon = "mouse-pointer",
    Callback = function()
       local hrp = hrp()
       firetouchinterest(mc2, hrp, 0)
       task.wait()
       firetouchinterest(mc2, hrp, 1)
    end,
})
end
