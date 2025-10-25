local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/vinh12eqweaws/zingmods/refs/heads/main/zingpro')))()

local Window = OrionLib:MakeWindow({Name = "Linh Đaa | VIET NAM PIECE", HidePremium = false, SaveConfig = true, ConfigFolder = "dxl_bf"})

local Tab = Window:MakeTab({
    Name = "Con Cặc",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Localplayer",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Tab3 = Window:MakeTab({
    Name = "Stats Skill",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab4 = Window:MakeTab({
    Name = "Con mẹ nó",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab5 = Window:MakeTab({
    Name = "Shop",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab6 = Window:MakeTab({
    Name = "Farm",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab7 = Window:MakeTab({
    Name = "Setting ",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab8 = Window:MakeTab({
    Name = "Raid 70%",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab9 = Window:MakeTab({
    Name = "Players",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab10 = Window:MakeTab({
    Name = "Fast attack",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab11 = Window:MakeTab({
    Name = "Update+fix",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Tab12 = Window:MakeTab({
    Name = "Script",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local AuraRange = 50
local auraCircle = nil

-- HĂ m táº¡o vĂ²ng trĂ²n
local function createAuraCircle()
    if auraCircle then auraCircle:Destroy() end
    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    auraCircle = Instance.new("Part")
    auraCircle.Anchored = true
    auraCircle.CanCollide = false
    auraCircle.Transparency = 0.5
    auraCircle.Color = Color3.fromRGB(0, 255, 0)
    auraCircle.Material = Enum.Material.Neon
    auraCircle.Shape = Enum.PartType.Cylinder
    auraCircle.Size = Vector3.new(AuraRange * 2, 0.1, AuraRange * 2)
    auraCircle.CFrame = hrp.CFrame * CFrame.Angles(math.rad(90), 0, 0)
    auraCircle.Parent = workspace
end

-- Cáº­p nháº­t vĂ²ng trĂ²n
local function updateAuraCircle()
    if auraCircle then
        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            auraCircle.Size = Vector3.new(AuraRange * 2, 0.1, AuraRange * 2)
            auraCircle.CFrame = hrp.CFrame * CFrame.Angles(math.rad(90), 0, 0)
        end
    end
end

-- Toggle Kill Aura
Tab:AddToggle({
    Name = "Kill Aura",
    Default = false,
    Callback = function(Value)
        getgenv().G = Value
        getgenv().Creator = 'https://discord.gg/B3HqPPzFYr - HalloweenGaster'

        if Value then
            createAuraCircle()
            while getgenv().G and getgenv().Creator == 'https://discord.gg/B3HqPPzFYr - HalloweenGaster' do
                task.wait(0.2)
                updateAuraCircle()

                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
                sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
                
                for _,d in pairs(game.Workspace:GetDescendants()) do
                    if d:IsA("Humanoid") 
                    and d.Parent:FindFirstChild("HumanoidRootPart")
                    and d.Parent.Name ~= game.Players.LocalPlayer.Name then
                        local distance = (d.Parent.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= AuraRange then
                            d.Health = 0
                        end
                    end
                end
            end
        else
            if auraCircle then
                auraCircle:Destroy()
                auraCircle = nil
            end
        end
    end
})

-- Slider chá»‰nh pháº¡m vi
Tab:AddSlider({
    Name = "KĂ­ch thÆ°á»›c aura",
    Min = 10,
    Max = 500,
    Default = 50,
    Color = Color3.fromRGB(0,255,0), -- mĂ u xanh lĂ¡
    Increment = 10,
    ValueName = "studs",
    Callback = function(Value)
        AuraRange = Value
        updateAuraCircle() -- cáº­p nháº­t ngay láº­p tá»©c khi kĂ©o
    end    
})
local PvPLoop = false

Tab:AddToggle({
    Name = "â­Attack PvP Off",
    Default = false,
    Callback = function(Value)
        PvPLoop = Value
        if Value then
            task.spawn(function()
                while PvPLoop do
                    local Players = game:GetService("Players")
                    for _, player in pairs(Players:GetPlayers()) do
                        if player and player:FindFirstChild("Backpack") then
                            local backpack = player.Backpack
                            -- Láº·p qua toĂ n bá»™ item trong Backpack
                            for _, item in pairs(backpack:GetChildren()) do
                                if item:IsA("Tool") or item:IsA("Model") then
                                    for _, property in pairs(item:GetChildren()) do
                                        if property:IsA("RemoteEvent") then
                                            property:FireServer()
                                            print(player.Name .. " Ä‘Ă£ kĂ­ch hoáº¡t " .. item.Name .. " -> " .. property.Name .. "!")
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end)
        else
            print("â­Attack PvP Off Ä‘Ă£ táº¯t")
        end
    end
})


-- Super ultra skill (chá»‰ kĂ­ch hoáº¡t 1 ná»­a)
Tab:AddButton({
    Name = "Super ultra skill",
    Callback = function()
        local allObjs = {}
        for _, obj in ipairs(game:GetDescendants()) do
            if obj:IsA("BindableEvent") or obj:IsA("RemoteEvent") then
                if obj.Name == "Fire" then
                    table.insert(allObjs, obj)
                end
            end
        end
        
        local halfCount = math.floor(#allObjs / 2)
        for i = 1, halfCount do
            local obj = allObjs[i]
            if obj:IsA("BindableEvent") then
                obj:Fire()
            elseif obj:IsA("RemoteEvent") then
                obj:FireServer()
            end
        end
        print("Super ultra skill: ÄĂ£ kĂ­ch hoáº¡t " .. halfCount .. " event")
    end
})

-- â­Super Legendary Spam skill (kĂ­ch hoáº¡t toĂ n bá»™)
Tab:AddButton({
    Name = "â­Super Legendary Spam skill",
    Callback = function()
        for _, obj in ipairs(game:GetDescendants()) do
            if obj:IsA("BindableEvent") or obj:IsA("RemoteEvent") then
                if obj.Name == "Fire" then
                    if obj:IsA("BindableEvent") then
                        obj:Fire()
                    elseif obj:IsA("RemoteEvent") then
                        obj:FireServer()
                    end
                end
            end
        end
        print("â­Super Legendary Spam skill: ÄĂ£ kĂ­ch hoáº¡t toĂ n bá»™")
    end
})
local TeleportButtons = {}

-- Táº¡o nĂºt dá»‹ch chuyá»ƒn
Tab:AddTextbox({
    Name = "Táº¡o nĂºt dá»‹ch chuyá»ƒn",
    Default = "",
    TextDisappear = true,
    Callback = function(text)
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local savePos = char.HumanoidRootPart.Position
            -- Táº¡o button má»›i
            local btn = Tab4:AddButton({
                Name = text,
                Callback = function()
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = CFrame.new(savePos)
                    end
                end
            })
            TeleportButtons[text] = {Button = btn, Position = savePos}
            print("ÄĂ£ táº¡o nĂºt dá»‹ch chuyá»ƒn: " .. text)
        end
    end
})

-- Ghi tĂªn nĂºt cáº§n xĂ³a lÆ°u
Tab:AddTextbox({
    Name = "Ghi tĂªn nĂºt cáº§n xĂ³a lÆ°u",
    Default = "",
    TextDisappear = true,
    Callback = function(text)
        if TeleportButtons[text] then
            -- KhĂ´ng cĂ³ hĂ m xĂ³a button trá»±c tiáº¿p trong OrionLib, chá»‰ xĂ³a khá»i báº£ng
            TeleportButtons[text] = nil
            print("ÄĂ£ xĂ³a nĂºt: " .. text)
        else
            print("KhĂ´ng tĂ¬m tháº¥y nĂºt tĂªn: " .. text)
        end
    end
})

-- XĂ³a táº¥t cáº£ lÆ°u settings
Tab:AddButton({
    Name = "XĂ³a táº¥t cáº£ lÆ°u settings",
    Callback = function()
        TeleportButtons = {}
        print("ÄĂ£ xĂ³a táº¥t cáº£ nĂºt vĂ  dá»¯ liá»‡u lÆ°u")
    end
})

-- Giáº£ sá»­ Tab4 Ä‘Ă£ Ä‘Æ°á»£c táº¡o sáºµn
Tab2:AddToggle({
    Name = "ESP",
    Default = false,
    Callback = function(state)
        if state then
            -- Báº­t ESP
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local char = player.Character or player.CharacterAdded:Wait()
                    local head = char:FindFirstChild("Head")
                    if head and not head:FindFirstChild("NameTag") then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "NameTag"
                        billboard.Size = UDim2.new(0, 200, 0, 50)
                        billboard.Adornee = head
                        billboard.AlwaysOnTop = true
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- mĂ u tráº¯ng
                        textLabel.TextScaled = true
                        textLabel.Font = Enum.Font.SourceSansBold
                        
                        -- Hiá»‡n tĂªn + khoáº£ng cĂ¡ch
                        local function updateText()
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and head then
                                local distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - head.Position).Magnitude)
                                textLabel.Text = player.Name .. " [" .. distance .. "m]"
                            end
                        end

                        game:GetService("RunService").RenderStepped:Connect(updateText)
                        textLabel.Parent = billboard
                        billboard.Parent = head
                    end
                end
            end

            print("ESP Ä‘Ă£ báº­t")
        else
            -- Táº¯t ESP
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    local tag = player.Character.Head:FindFirstChild("NameTag")
                    if tag then
                        tag:Destroy()
                    end
                end
            end
            print("ESP Ä‘Ă£ táº¯t")
        end
    end
})
Tab2:AddToggle({
    Name = "ESP Backpack",
    Default = false,
    Callback = function(Value)
        getgenv().ESPBackpack = Value

        if Value then
            -- Táº¡o ESP cho táº¥t cáº£ ngÆ°á»i chÆ¡i
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer

            -- HĂ m táº¡o BillboardGui hiá»ƒn thá»‹ tĂªn + Backpack
            local function createESP(player)
                if player.Character and player.Character:FindFirstChild("Head") then
                    if player.Character.Head:FindFirstChild("BackpackESP") then
                        player.Character.Head.BackpackESP:Destroy()
                    end

                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "BackpackESP"
                    billboard.Adornee = player.Character.Head
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLabel.TextStrokeTransparency = 0
                    nameLabel.TextScaled = true
                    nameLabel.Text = player.Name
                    nameLabel.Parent = billboard

                    local itemsLabel = Instance.new("TextLabel")
                    itemsLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    itemsLabel.Position = UDim2.new(0, 0, 0.5, 0)
                    itemsLabel.BackgroundTransparency = 1
                    itemsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    itemsLabel.TextStrokeTransparency = 0
                    itemsLabel.TextScaled = true
                    itemsLabel.Text = table.concat(
                        (function()
                            local items = {}
                            for _, tool in ipairs(player.Backpack:GetChildren()) do
                                table.insert(items, tool.Name)
                            end
                            return items
                        end)(),
                        ", "
                    )
                    itemsLabel.Parent = billboard

                    billboard.Parent = player.Character.Head
                end
            end

            -- ESP ban Ä‘áº§u
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    createESP(player)
                end
            end

            -- Tá»± Ä‘á»™ng cáº­p nháº­t khi cĂ³ ngÆ°á»i má»›i hoáº·c thay Ä‘á»•i backpack
            Players.PlayerAdded:Connect(function(player)
                if getgenv().ESPBackpack then
                    player.CharacterAdded:Connect(function()
                        task.wait(1)
                        createESP(player)
                    end)
                end
            end)

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    player.Backpack.ChildAdded:Connect(function()
                        if getgenv().ESPBackpack then
                            createESP(player)
                        end
                    end)
                    player.Backpack.ChildRemoved:Connect(function()
                        if getgenv().ESPBackpack then
                            createESP(player)
                        end
                    end)
                end
            end

        else
            -- Táº¯t ESP
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    local esp = player.Character.Head:FindFirstChild("BackpackESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Tracers",
    Default = false,
    Callback = function(Value)
        tracersEnabled = Value
    end
})

-- Code ESP + Tracers sau
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = game:GetService("Workspace").CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Tracers = {}

local function CreateESP(plr)
    if plr.Character and plr.Character:FindFirstChild("Head") then
        if plr.Character.Head:FindFirstChild("NameESP") then
            plr.Character.Head.NameESP:Destroy()
        end
        
        local Billboard = Instance.new("BillboardGui")
        Billboard.Name = "NameESP"
        Billboard.Adornee = plr.Character.Head
        Billboard.Size = UDim2.new(0, 200, 0, 50)
        Billboard.StudsOffset = Vector3.new(0, 2, 0)
        Billboard.AlwaysOnTop = true

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Font = Enum.Font.SourceSansBold
        TextLabel.TextSize = 14
        TextLabel.TextStrokeTransparency = 0
        TextLabel.Text = plr.Name

        if plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then
            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Xanh lĂ¡
        else
            TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Äá»
        end

        TextLabel.Parent = Billboard
        Billboard.Parent = plr.Character.Head
    end
end

local function OnCharacterAdded(plr)
    plr.CharacterAdded:Connect(function()
        wait(0.1)
        CreateESP(plr)
    end)
end

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        OnCharacterAdded(plr)
        if plr.Character then
            CreateESP(plr)
        end
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= LocalPlayer then
        OnCharacterAdded(plr)
    end
end)

RunService.RenderStepped:Connect(function()
    wait(0.1)
    if tracersEnabled then
        for _, t in pairs(Tracers) do
            t:Remove()
        end
        Tracers = {}

        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if onScreen then
                    local line = Drawing.new("Line")
                    line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    line.To = Vector2.new(pos.X, pos.Y)

                    if plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then
                        line.Color = Color3.fromRGB(0, 255, 0)
                    else
                        line.Color = Color3.fromRGB(255, 0, 0)
                    end

                    line.Thickness = 1
                    line.Transparency = 1
                    line.Visible = true
                    table.insert(Tracers, line)
                end
            end
        end
    else
        for _, t in pairs(Tracers) do
            t:Remove()
        end
        Tracers = {}
    end
end)

OrionLib:Init()


-- Thanh kĂ©o chá»‰nh size chá»¯ ESP
Tab2:AddSlider({
    Name = "ESP Name Size",
    Min = 10,
    Max = 50,
    Default = 20,
    Color = Color3.fromRGB(0, 255, 0), -- MĂ u xanh lĂ¡
    Increment = 1,
    ValueName = "Size",
    Callback = function(Value)
        getgenv().ESPNameSize = Value
        print("ESP Size:", Value)
    end    
})
-- LÆ°u vá»‹ trĂ­ trÆ°á»›c khi cháº¿t
local lastPosition = nil
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- NĂºt On/Off
Tab2:AddToggle({
    Name = "Tá»± Ä‘á»™ng quay láº¡i chá»— Ä‘Ă£ cháº¿t",
    Default = false,
    Callback = function(Value)
        getgenv().ReturnToDeathSpot = Value
        if Value then
            print("Tá»± Ä‘á»™ng quay láº¡i: Báº¬T")
        else
            print("Tá»± Ä‘á»™ng quay láº¡i: Táº®T")
        end
    end
})

-- Theo dĂµi vá»‹ trĂ­ khi cĂ²n sá»‘ng
task.spawn(function()
    while task.wait(1) do
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            lastPosition = LocalPlayer.Character.HumanoidRootPart.Position
        end
    end
end)

-- Khi nhĂ¢n váº­t cháº¿t â†’ Teleport láº¡i
LocalPlayer.CharacterAdded:Connect(function(char)
    if getgenv().ReturnToDeathSpot and lastPosition then
        char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(lastPosition)
    end
end)
Tab2:AddButton({
    Name = "Set/XoĂ¡ Ä‘iá»ƒm há»“i sinh/Saving",
    Callback = function()
        if _G.CustomRespawnPoint then
            _G.CustomRespawnPoint = nil
            game:GetService("Players").LocalPlayer:FindFirstChild("RespawnLocation").Value = nil
            OrionLib:MakeNotification({
                Name = "Há»“i sinh",
                Content = "ÄĂ£ xoĂ¡ Ä‘iá»ƒm há»“i sinh tuá»³ chá»‰nh!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                _G.CustomRespawnPoint = char.HumanoidRootPart.Position
                OrionLib:MakeNotification({
                    Name = "Há»“i sinh",
                    Content = "ÄĂ£ lÆ°u vá»‹ trĂ­ há»“i sinh táº¡i: " .. tostring(_G.CustomRespawnPoint),
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            end
        end
    end    
})
Tab2:AddButton({
    Name = "Base Sky/Saving",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")

        if hrp then
            -- Táº¡o Part pháº³ng 200x1x200
            local basePart = Instance.new("Part")
            basePart.Size = Vector3.new(200, 1, 200)
            basePart.Anchored = true
            basePart.Position = hrp.Position + Vector3.new(0, 10000, 0)
            basePart.BrickColor = BrickColor.new("White")
            basePart.Parent = workspace

            -- Teleport ngÆ°á»i chÆ¡i lĂªn Base
            hrp.CFrame = CFrame.new(basePart.Position + Vector3.new(0, 5, 0))
        end
    end
})
local AutoRemoveEffectsEnabled = false

Tab2:AddToggle({
    Name = "Auto XoĂ¡ Hiá»‡u á»¨ng(Ä‘ang tá»‘i Æ°uđŸ“‰)",
    Callback = function(Value)
        AutoRemoveEffectsEnabled = Value
        if Value then
            coroutine.wrap(function()
                while AutoRemoveEffectsEnabled do
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Sound") then
                            pcall(function()
                                v:Destroy()
                            end)
                        end
                    end
                    task.wait()
                end
            end)()
        end
    end
})

Tab2:AddToggle({
    Name = "â­ Auto armor",
    Default = false,
    Callback = function(Value)
        getgenv().AutoArmor = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoArmor do
                    local Players = game:GetService("Players")
                    local armors = {
                        "Cursed-Armor", "Unique-Armor", "Darkness-Armor", 
                        "Thunder-Armor", "Diamond-Armor", "Golden-Armor", 
                        "Epic-Armor", "Iron-Armor", "Wooden-Armor"
                    }
                    
                    for _, player in pairs(Players:GetPlayers()) do
                        local backpack = player:FindFirstChild("Backpack")
                        if backpack then
                            for _, armorName in pairs(armors) do
                                local armor = backpack:FindFirstChild(armorName)
                                if armor and armor:FindFirstChild("K") and armor.K:FindFirstChild("Fire") then
                                    armor.K.Fire:FireServer()
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})
Tab2:AddToggle({
    Name = "â­ Auto Storages",
    Default = false,
    Callback = function(Value)
        autoStorages = Value
        if autoStorages then
            task.spawn(function()
                while autoStorages do
                    pcall(function()
                        local Players = game:GetService("Players")
                        for _, player in pairs(Players:GetPlayers()) do
                            local backpack = player:FindFirstChild("Backpack")
                            if backpack then
                                for _, storage in pairs(backpack:GetChildren()) do
                                    if storage:IsA("Tool") and storage.Name:find("Storage") then
                                        if storage:FindFirstChild("K") and storage.K:FindFirstChild("Fire") then
                                            storage.K.Fire:FireServer()
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end
})
Tab2:AddToggle({
    Name = "Inf Jump",
    Default = false,
    Callback = function(Value)
        InfJump = Value
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump then
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
Tab2:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(Value)
        Noclip = Value
        if Noclip then
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                local char = game:GetService("Players").LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
        end
    end
})

local autoAura = false

Tab3:AddToggle({
    Name = " Auto Skills Aura",
    Default = false,
    Callback = function(Value)
        autoAura = Value
        if autoAura then
            task.spawn(function()
                while autoAura do
                    local fired = false
                    for _, obj in ipairs(game:GetDescendants()) do
                        if obj:IsA("RemoteEvent") and obj.Name == "Fire" then
                            obj:FireServer()
                            fired = true
                            break -- Ngá»«ng sau khi tĂ¬m vĂ  báº¯n 1 cĂ¡i
                        end
                    end
                    task.wait(1) -- chá»‰ báº¯n 1 láº§n má»—i giĂ¢y
                end
            end)
        end
    end
})
Tab3:AddSlider({
    Name = "KĂ­ch thÆ°á»›c Aura",
    Min = 10,
    Max = 500,
    Default = 50,
    Color = Color3.fromRGB(0,255,0), -- mĂ u xanh lĂ¡
    Increment = 10,
    ValueName = "studs",
    Callback = function(Value)
        auraSize = Value
    end
})

OrionLib:Init()

-- Auto Melee
Tab3:AddToggle({
    Name = "Auto Melee",
    Default = false,
    Callback = function(state)
        getgenv().AutoMelee = state
        spawn(function()
            while getgenv().AutoMelee do
                local args = {"Melee"}
                game:GetService("ReplicatedStorage"):WaitForChild("StatSystem"):WaitForChild("Points"):FireServer(unpack(args))
                wait(0.1)
            end
        end)
    end
})

-- Auto Health
Tab3:AddToggle({
    Name = "Auto Health",
    Default = false,
    Callback = function(state)
        getgenv().AutoHealth = state
        spawn(function()
            while getgenv().AutoHealth do
                local args = {"MaxHealth"}
                game:GetService("ReplicatedStorage"):WaitForChild("StatSystem"):WaitForChild("Points"):FireServer(unpack(args))
                wait(0.1)
            end
        end)
    end
})

-- Auto Sword
Tab3:AddToggle({
    Name = "Auto Sword",
    Default = false,
    Callback = function(state)
        getgenv().AutoSword = state
        spawn(function()
            while getgenv().AutoSword do
                local args = {"Sword"}
                game:GetService("ReplicatedStorage"):WaitForChild("StatSystem"):WaitForChild("Points"):FireServer(unpack(args))
                wait(0.1)
            end
        end)
    end
})

-- Auto DevilFruit
Tab3:AddToggle({
    Name = "Auto DevilFruit",
    Default = false,
    Callback = function(state)
        getgenv().AutoDF = state
        spawn(function()
            while getgenv().AutoDF do
                local args = {"DevilFruit"}
                game:GetService("ReplicatedStorage"):WaitForChild("StatSystem"):WaitForChild("Points"):FireServer(unpack(args))
                wait(0.1)
            end
        end)
    end
})

OrionLib:Init()

-- CĂ¡c biáº¿n on/off
local AutoZ = false
local AutoX = false
local AutoC = false
local AutoB = false
local AutoN = false

-- ThĂªm nĂºt on/off
Tab3:AddToggle({
    Name = "Auto Z",
    Default = false,
    Callback = function(Value)
        AutoZ = Value
    end
})

Tab3:AddToggle({
    Name = "Auto X",
    Default = false,
    Callback = function(Value)
        AutoX = Value
    end
})

Tab3:AddToggle({
    Name = "Auto C",
    Default = false,
    Callback = function(Value)
        AutoC = Value
    end
})

Tab3:AddToggle({
    Name = "Auto B",
    Default = false,
    Callback = function(Value)
        AutoB = Value
    end
})

Tab3:AddToggle({
    Name = "Auto N",
    Default = false,
    Callback = function(Value)
        AutoN = Value
    end
})

-- HĂ m auto nháº¥n phĂ­m (sá»­ dá»¥ng VirtualInputManager)
local function PressKey(key)
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, key, false, game)
    task.wait(0.05)
    vim:SendKeyEvent(false, key, false, game)
end

-- VĂ²ng láº·p auto báº¥m phĂ­m
task.spawn(function()
    while task.wait(0.1) do
        local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            if AutoZ then PressKey(Enum.KeyCode.Z) end
            if AutoX then PressKey(Enum.KeyCode.X) end
            if AutoC then PressKey(Enum.KeyCode.C) end
            if AutoB then PressKey(Enum.KeyCode.B) end
            if AutoN then PressKey(Enum.KeyCode.N) end
        end
    end
end)

OrionLib:Init()


local selectedPlayerName = nil

-- HĂ m láº¥y danh sĂ¡ch tĂªn ngÆ°á»i chÆ¡i realtime
local function getPlayerNames()
    local list = {}
    for _, plr in pairs(Players:GetPlayers()) do
        table.insert(list, plr.Name)
    end
    return list
end

local dropdown = Tab4:AddDropdown({
    Name = "ngÆ°á»i chÆ¡i check",
    Default = "Chá»n...",
    Options = getPlayerNames(),
    Callback = function(value)
        selectedPlayerName = value
    end
})

-- NĂºt check 3 kho
Tab4:AddButton({
    Name = "Check 3 kho",
    Callback = function()
        if not selectedPlayerName then
            OrionLib:MakeNotification({
                Name = "Lá»—i",
                Content = "Vui lĂ²ng chá»n má»™t ngÆ°á»i chÆ¡i!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            return
        end

        local plr = Players:FindFirstChild(selectedPlayerName)
        if not plr then
            OrionLib:MakeNotification({
                Name = "Lá»—i",
                Content = "NgÆ°á»i chÆ¡i khĂ´ng tá»“n táº¡i!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            return
        end

        local storedata = plr:FindFirstChild("storedata")
        local storedata1 = plr:FindFirstChild("storedata1")
        local storedata2 = plr:FindFirstChild("storedata2")

        local msg = "ThĂ´ng tin 3 kho cá»§a "..selectedPlayerName..":\n"
        msg = msg.."storedata: "..(storedata and tostring(storedata.Value) or "KhĂ´ng cĂ³").."\n"
        msg = msg.."storedata1: "..(storedata1 and tostring(storedata1.Value) or "KhĂ´ng cĂ³").."\n"
        msg = msg.."storedata2: "..(storedata2 and tostring(storedata2.Value) or "KhĂ´ng cĂ³")

        OrionLib:MakeNotification({
            Name = "3 Kho cá»§a "..selectedPlayerName,
            Content = msg,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- NĂºt check Level and Belis
Tab4:AddButton({
    Name = "Check Level and Belis",
    Callback = function()
        if not selectedPlayerName then
            OrionLib:MakeNotification({
                Name = "Lá»—i",
                Content = "Vui lĂ²ng chá»n má»™t ngÆ°á»i chÆ¡i!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            return
        end

        local plr = Players:FindFirstChild(selectedPlayerName)
        if not plr then
            OrionLib:MakeNotification({
                Name = "Lá»—i",
                Content = "NgÆ°á»i chÆ¡i khĂ´ng tá»“n táº¡i!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            return
        end

        -- Láº¥y data tá»« Data (thÆ°á»ng lĂ  má»™t Folder hoáº·c Object con cá»§a player)
        local dataFolder = plr:FindFirstChild("Data")
        if not dataFolder then
            OrionLib:MakeNotification({
                Name = "Lá»—i",
                Content = "KhĂ´ng tĂ¬m tháº¥y Data cá»§a ngÆ°á»i chÆ¡i!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            return
        end

        local level = dataFolder:FindFirstChild("Levels")
        local belis = dataFolder:FindFirstChild("Belis")

        local msg = "ThĂ´ng tin Level vĂ  Belis cá»§a "..selectedPlayerName..":\n"
        msg = msg.."Level: "..(level and tostring(level.Value) or "KhĂ´ng cĂ³").."\n"
        msg = msg.."Belis: "..(belis and tostring(belis.Value) or "KhĂ´ng cĂ³")

        OrionLib:MakeNotification({
            Name = "Level & Belis cá»§a "..selectedPlayerName,
            Content = msg,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

-- Cáº­p nháº­t dropdown khi cĂ³ ngÆ°á»i chÆ¡i má»›i hoáº·c ra Ä‘i
Players.PlayerAdded:Connect(function()
    dropdown:Refresh(getPlayerNames())
end)
Players.PlayerRemoving:Connect(function()
    dropdown:Refresh(getPlayerNames())
end)

OrionLib:Init()
Tab4:AddTextbox({
    Name = "Fake Level",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        local dataFolder = LocalPlayer:FindFirstChild("Data")
        if not dataFolder then return end
        local level = dataFolder:FindFirstChild("Levels")
        if not level then return end
        local num = tonumber(value)
        if num then
            level.Value = num
            print("Set Level thĂ nh:", num)
        end
    end
})
Tab4:AddTextbox({
    Name = "Fake Beli",
    Default = "",
    TextDisappear = false,
    Callback = function(value)
        local dataFolder = game.Players.LocalPlayer:FindFirstChild("Data")
        if not dataFolder then return end
        local belis = dataFolder:FindFirstChild("Belis")
        if not belis then return end
        local num = tonumber(value)
        if num then
            belis.Value = num
            print("Set Beli thĂ nh:", num)
        end
    end
})
Tab4:AddButton({
    Name = "Rain item but fake",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "ThĂ´ng bĂ¡o",
            Content = "Lá»—i: khĂ´ng rÆ¡i fruit, tá»§n sáº½ fix sá»›m!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})
Tab4:AddButton({
    Name = "XĂ³a táº¥t cáº£ item fake",
    Callback = function()
        for _, obj in pairs(fakeItemsFolder:GetChildren()) do
            obj:Destroy()
        end
    end
})
local BagOptions = {"100k (sell)", "1M beli (sell)", "10M beli (sell)", "100M beli (sell)", "1B beli (sell)"}
local SelectedBag = BagOptions[1]
local AutoHuyEnabled = false

Tab5:AddDropdown({
    Name = "Choose Bag",
    Options = BagOptions,
    CurrentOption = BagOptions[1],
    Callback = function(Option)
        SelectedBag = Option
    end
})

Tab5:AddToggle({
    Name = "Auto buy",
    Callback = function(Value)
        AutoHuyEnabled = Value
        while AutoHuyEnabled do
            -- Code auto buy á»Ÿ Ä‘Ă¢y
            wait(0.1)
        end
    end
})

local SecretX10 = false

Tab5:AddToggle({
    Name = "Secret X10â­",
    Default = false,
    Callback = function(state)
        SecretX10 = state
        if SecretX10 then
            spawn(function()
                while SecretX10 do
                    pcall(function()
                        local secretPart = game:GetService("Workspace").MAP["STARTER ISLAND [ Lv 1+ ]"]["Secret Random"].RANDOM
                        if secretPart and secretPart:FindFirstChild("ClickDetector") then
                            fireclickdetector(secretPart.ClickDetector)
                        end
                    end)
                    wait(0.1)
                end
            end)
        end
    end
})
Tab5:AddButton({
    Name = "Buy sniper combat",
    Callback = function()
        local target = game:GetService("Workspace").MAP["DAK ISLAND [Lv 1350+]"]:FindFirstChildWhichIsA("ClickDetector", true)
        if target then
            fireclickdetector(target)
        else
            warn("KhĂ´ng tĂ¬m tháº¥y ClickDetector á»Ÿ vá»‹ trĂ­ chá»‰ Ä‘á»‹nh!")
        end
    end
})
local AutoSandoEnabled = false

Tab5:AddToggle({
    Name = "Auto Sando x5â­",
    Callback = function(Value)
        AutoSandoEnabled = Value
        while AutoSandoEnabled do
            fireclickdetector(game:GetService("Workspace")["Map-Islands"]["Platinum Town [ 2000 - 3000 ]"].PlatinumMAP.GodBox.ClickDetector)
            wait(0.1)
        end
    end
})
Tab5:AddToggle({
    Name = "Auto Random Fruit",
    Callback = function(Value)
        if Value then
            -- Code cháº¡y khi nĂºt Ä‘Æ°á»£c kĂ­ch hoáº¡t
            while Value do
                fireclickdetector(workspace.MAP["STARTER ISLAND [ Lv 1+ ]"].Shop[" "].RANDOM.ClickDetector)
                wait(0.1)
            end
        else
            -- Code cháº¡y khi nĂºt Ä‘Æ°á»£c táº¯t
        end
    end
})

local AutoYoruEnabled = false

Tab5:AddToggle({
    Name = "Auto Yoru V3 x10â­",
    Callback = function(Value)
        AutoYoruEnabled = Value
        while AutoYoruEnabled do
            fireclickdetector(workspace.MAP["DAK ISLAND [Lv 1350+]"]["Yoru V3 random"].ClickDetector)
            wait(0.1)
        end
    end
})



local NPCList = {}
for _, v in pairs(workspace["NPC DAMAGE"]:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
        table.insert(NPCList, v.Name)
    end
end

local SelectedNPC
local chonnpc
Tab6:AddDropdown({
    Name = "Chá»n NPC",
    Options = NPCList,
    Flag = "NPCDropdown",
    Callback = function(Value)
        SelectedNPC = Value
        chonnpc = workspace["NPC DAMAGE"]:FindFirstChild(Value)
    end
})

local function IncreaseHitbox()
    _G.HeadSize = 10
    _G.Disabled = true
    game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
            local npc = workspace["NPC DAMAGE"]:FindFirstChild(SelectedNPC)
            if npc and npc:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    npc.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    npc.HumanoidRootPart.Transparency = 0.7
                    npc.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    npc.HumanoidRootPart.Material = "Neon"
                    npc.HumanoidRootPart.CanCollide = false
                end)
            end
        end
    end)
end

local function TeleportToNPC()
    local npc = workspace["NPC DAMAGE"]:FindFirstChild(SelectedNPC)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
    end
end

local BringNPCEnabled = false
local function bringNPCs()
    local localPlayer = game.Players.LocalPlayer
    if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    local playerHRP = localPlayer.Character.HumanoidRootPart
    if chonnpc and chonnpc:FindFirstChild("HumanoidRootPart") then
        chonnpc.HumanoidRootPart.CFrame = playerHRP.CFrame * CFrame.new(0, 0, -5)
    end
end

local function BringNPC()
    BringNPCEnabled = not BringNPCEnabled
    if BringNPCEnabled then
        while BringNPCEnabled do
            wait(0.1)
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
            sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
            bringNPCs()
        end
    end
end

Tab6:AddButton({
    Name = "TÄƒng Hitbox",
    Callback = IncreaseHitbox
})

Tab6:AddButton({
    Name = "Teleport to NPC",
    Callback = TeleportToNPC
})

Tab6:AddToggle({
    Name = "Bring NPC",
    Callback = function(Value)
        BringNPCEnabled = Value
        if Value then
            BringNPC()
        end
    end
})
local AutoNVList = {
    "Kaidou",
    "Kirin",
    "Grab",
    "Sukuna",
    "Pride"
}

local SelectedAutoNV
local AutoNVEnabled = false

Tab6:AddDropdown({
    Name = "Auto NV",
    Options = AutoNVList,
    Flag = "AutoNVDropdown",
    Callback = function(Value)
        SelectedAutoNV = Value
    end
})

Tab6:AddToggle({
    Name = "Báº­t Auto NV",
    Callback = function(Value)
        AutoNVEnabled = Value
        if Value then
            spawn(function()
                while AutoNVEnabled do
                    if SelectedAutoNV == "Kaidou" then
                        workspace["Map-Islands"]["Kaido Island [ Lv 1000+ ]"]["KAIDOUU QUESTTT"].ClickPart.QuestTake.QuestTake.Accept1.RemoteEvent:FireServer()
                    elseif SelectedAutoNV == "Kirin" then
                        workspace.NPCS.QuestSpecial.ClickPart.QuestTake.QuestTake.Accept3.RemoteEvent:FireServer()
                    elseif SelectedAutoNV == "Grab" then
                        workspace.NPCS.Quest7.ClickPart.QuestTake.QuestTake.Accept2.RemoteEvent:FireServer()
                    elseif SelectedAutoNV == "Sukuna" then
                        workspace.NPCS.Quest6.ClickPart.QuestTake.QuestTake.Accept2.RemoteEvent:FireServer()
                    elseif SelectedAutoNV == "Pride" then
                        workspace.NPCS.Quest9.ClickPart.QuestTake.QuestTake.Accept3.RemoteEvent:FireServer()
                    end
                    wait(0.1)
                end
            end)
        end
    end
})




-- NĂºt VĂ o Raid
Tab8:AddButton({
    Name = "VĂ o Raid",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        local raidModeID = 18859789310
        TeleportService:Teleport(raidModeID, player)
    end
})

-- Auto Hop Raid
getgenv().AutoHopRaid = false
Tab8:AddToggle({
    Name = "Auto Hop Raid",
    Default = false,
    Callback = function(state)
        getgenv().AutoHopRaid = state
        while getgenv().AutoHopRaid do
            local TeleportService = game:GetService("TeleportService")
            local player = game.Players.LocalPlayer
            local raidModeID = 18859789310
            TeleportService:Teleport(raidModeID, player)
            task.wait(5) -- delay Ä‘á»ƒ trĂ¡nh spam
        end
    end
})

-- Auto Cáº¥t Item Raid (Æ°u tiĂªn SJW)
getgenv().AutoStoreItemRaid = false
Tab8:AddToggle({
    Name = "Auto Cáº¥t Item Raid (Æ°u tiĂªn SJW)",
    Default = false,
    Callback = function(state)
        getgenv().AutoStoreItemRaid = state
        while getgenv().AutoStoreItemRaid do
            -- Æ¯u tiĂªn cáº¥t SJW
            for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name:find("SJW") or v.Name:find("Raid") then
                    game:GetService("ReplicatedStorage").RemoteEventName:FireServer(v) -- thay RemoteEventName thĂ nh cĂ¡i báº¡n dĂ¹ng Ä‘á»ƒ cáº¥t item
                end
            end
            task.wait(0.1)
        end
    end
})

OrionLib:Init()
local HitboxEnabled = false
_G.HeadSize = 1000

game:GetService('RunService').RenderStepped:connect(function()
    if HitboxEnabled then
        for i, v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.CanCollide = false
                end)
            end
        end
    else
        for i, v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.Character.HumanoidRootPart.Transparency = 0
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Flesh")
                    v.Character.HumanoidRootPart.Material = "SmoothPlastic"
                    v.Character.HumanoidRootPart.CanCollide = true
                end)
            end
        end
    end
end)

Tab9:AddToggle({
    Name = "Hitbox All players đŸ“‰",
    Callback = function(Value)
        HitboxEnabled = Value
    end
})
local Players = game:GetService("Players")
local SelectedPlayer = nil

local playerList = {}
for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        table.insert(playerList, player.Name)
    end
end

local dropdown = Tab9:AddDropdown({
    Name = "Chá»n tháº±ng Ngu",
    Options = playerList,
    Callback = function(option)
        SelectedPlayer = option
    end
})

local bringPlayerEnabled = false
local killEnabled = false

local function bringPlayer()
    while bringPlayerEnabled do
        if SelectedPlayer then
            local targetPlayer = Players:FindFirstChild(SelectedPlayer)
            if targetPlayer and targetPlayer.Character then
                Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        wait(0.1)
    end
end

local function killPlayer()
    while killEnabled do
        if SelectedPlayer then
            local targetPlayer = Players:FindFirstChild(SelectedPlayer)
            if targetPlayer and targetPlayer.Character then
                Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                -- Code kĂ­ch hoáº¡t RemoteEvent á»Ÿ Ä‘Ă¢y
                local Players = game:GetService("Players")
                for _, player in pairs(Players:GetPlayers()) do
                    if player and player:FindFirstChild("Backpack") then
                        local backpack = player.Backpack
                        for _, item in pairs(backpack:GetChildren()) do
                            if item:IsA("Tool") or item:IsA("Model") then
                                for _, property in pairs(item:GetChildren()) do
                                    if property:IsA("RemoteEvent") then
                                        property:FireServer()
                                        print(player.Name .. " Ä‘Ă£ kĂ­ch hoáº¡t " .. item.Name .. " -> " .. property.Name .. "!")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        wait(0.1)
    end
end

Tab9:AddToggle({
    Name = "Bring Player",
    Callback = function(value)
        bringPlayerEnabled = value
        if value then
            spawn(bringPlayer)
        end
    end
})

Tab9:AddToggle({
    Name = "Kill",
    Callback = function(value)
        killEnabled = value
        if value then
            spawn(killPlayer)
        end
    end
})

local Player = game:GetService("Players").LocalPlayer
local Backpack = Player:WaitForChild("Backpack")
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Láº¥y danh sĂ¡ch tool
local function GetTools()
    local tools = {}
    for _, v in ipairs(Backpack:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end
    for _, v in ipairs(Player.Character:GetChildren()) do
        if v:IsA("Tool") then
            table.insert(tools, v.Name)
        end
    end
    return tools
end

-- Dropdown chá»n item
local Dropdown1 = Tab10:AddDropdown({
    Name = "Item List",
    Description = "Select an item",
    Options = GetTools(),
    Default = nil,
    Callback = function(Value)
        _G.SelectedTool = Value
        -- Äá»•i chá»¯ Katana thĂ nh tool Ä‘Ă£ chá»n
        local katana = PlayerGui:FindFirstChild("Katana")
        if katana and katana:IsA("TextLabel") then
            katana.Text = Value
        end
    end
})

-- Auto refresh dropdown khi cĂ³ thay Ä‘á»•i Backpack
Backpack.ChildAdded:Connect(function()
    Dropdown1:Refresh(GetTools())
end)
Backpack.ChildRemoved:Connect(function()
    Dropdown1:Refresh(GetTools())
end)

-- Dropdown chá»‰nh tá»‘c Ä‘á»™ Fast Attack
_G.FastAttackWait = 0.1 -- máº·c Ä‘á»‹nh
local SpeedDropdown = Tab7:AddDropdown({
    Name = "Fast Attack Speed",
    Description = "Chá»n tá»‘c Ä‘á»™ Ä‘Ă¡nh",
    Options = {"0.1","0.2","0.5","1"},
    Default = "0.1",
    Callback = function(Value)
        _G.FastAttackWait = tonumber(Value)
    end
})

-- Toggle Fast Attack V1
local fastAttackEnabled = false
local Toggle1 = Tab10:AddToggle({
    Name = "Fast Attack V1",
    Description = "Spam hitbox",
    Default = false,
    Callback = function(Value)
        fastAttackEnabled = Value
        if Value then
            spawn(function()
                while fastAttackEnabled do
                    if _G.SelectedTool then
                        local args = {8, 1}
                        pcall(function()
                            local GuiTool = PlayerGui:FindFirstChild(_G.SelectedTool)
                            if GuiTool and GuiTool:FindFirstChild("Skill1b") then
                                local Skill1b = GuiTool:FindFirstChild("Skill1b")
                                local Z = Skill1b:FindFirstChild("Z")
                                if Z and Z:FindFirstChild("TextButtonm1") then
                                    local Btn = Z:FindFirstChild("TextButtonm1")
                                    if Btn and Btn:FindFirstChild("Hitbox") then
                                        Btn.Hitbox:FireServer(unpack(args))
                                    end
                                end
                            end
                        end)
                    end
                    task.wait(_G.FastAttackWait) -- thay Ä‘á»•i theo dropdown
                end
            end)
        end
    end
})
-- Dropdown chá»‰nh tá»‘c Ä‘á»™ cháº¡y
local WalkspeedDropdown = Tab7:AddDropdown({
    Name = "Chá»n tá»‘c Ä‘á»™ cháº¡y",
    Description = "Thay Ä‘á»•i tá»‘c Ä‘á»™ di chuyá»ƒn",
    Options = {"20","40","50","100","200"},
    Default = "20",
    Callback = function(Value)
        local char = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = tonumber(Value)
        end
    end
})


local Player = game.Players.LocalPlayer
local beliValue = Player:WaitForChild("Data"):WaitForChild("Belis")

-- HĂ m format sá»‘
local function FormatNumber(num)
	if num >= 1e9 then
		return string.format("%.2fB", num / 1e9)
	elseif num >= 1e6 then
		return string.format("%.2fM", num / 1e6)
	elseif num >= 1e3 then
		return string.format("%.1fK", num / 1e3)
	else
		return tostring(num)
	end
end

-- Biáº¿n lÆ°u
local StartTime = tick()
local StartValue = beliValue.Value
local Gained = 0
local BeliPerHour = 0

-- Label hiá»ƒn thá»‹
local LabelGained = Tab7:AddLabel("Beli kiáº¿m Ä‘Æ°á»£c: 0")
local LabelPerHour = Tab7:AddLabel("Beli/giá»: 0")

-- Cáº­p nháº­t khi Beli thay Ä‘á»•i
beliValue.Changed:Connect(function(newVal)
    Gained = newVal - StartValue
    local elapsed = (tick() - StartTime) / 3600 -- Ä‘á»•i ra giá»
    if elapsed > 0 then
        BeliPerHour = math.floor(Gained / elapsed)
    end

    LabelGained:Set("Beli kiáº¿m Ä‘Æ°á»£c: " .. FormatNumber(Gained))
    LabelPerHour:Set("Beli/giá»: " .. FormatNumber(BeliPerHour))
end)
Tab11:AddLabel("Fix khĂ´ng hiá»‡n raid")
Tab12:AddLabel("Linh Đaa")

--// TextBox nháº­p code
Tab7:AddTextbox({
	Name = "Code",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local ClipboardCode = nil
		
		if Value == "175Sub" then
			ClipboardCode = [[
while true do 
	workspace.NPCS.Quest9.ClickPart.QuestTake.QuestTake.Accept1.RemoteEvent:FireServer()
	wait(0.1)
end
]]
		elseif Value == "Tunbee" then
			ClipboardCode = [[
local Players = game:GetService("Players")
local armors = {"Cursed-Armor", "Unique-Armor", "Darkness-Armor", "Thunder-Armor", "Thunder-Armor", "Diamond-Armor", "Golden-Armor", "Epic-Armor", "Iron-Armor", "Wooden-Armor"}

for _, player in pairs(Players:GetPlayers()) do
	local backpack = player:FindFirstChild("Backpack")
	if backpack then
		for _, armorName in pairs(armors) do
			local armor = backpack:FindFirstChild(armorName)
			if armor and armor:FindFirstChild("K") and armor.K:FindFirstChild("Fire") then
				armor.K.Fire:FireServer()
			end
		end
	end
end
]]
		elseif Value == "KA2024" then
			ClipboardCode = [[
getgenv().G = true
getgenv().Creator = 'https://discord.gg/B3HqPPzFYr - HalloweenGaster'
while getgenv().G and getgenv().Creator == 'https://discord.gg/B3HqPPzFYr - HalloweenGaster' do
	wait(0.9)
	sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 112412400000)
	sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 112412400000)
	for i,d in pairs(game.Workspace:GetDescendants()) do
		if d.ClassName == 'Humanoid' and d.Parent.Name ~= game.Players.LocalPlayer.Name then
			d.Health = 0
		end
	end
end
]]
		elseif Value == "Secret" then
			ClipboardCode = [[
while true do
	fireclickdetector(game:GetService("Workspace").MAP["STARTER ISLAND [ Lv 1+ ]"]["Secret Random"].RANDOM)
	wait(0.1)
end
]]
		end

		-- Náº¿u cĂ³ code thĂ¬ copy vĂ o clipboard
		if ClipboardCode then
			setclipboard(ClipboardCode)
			OrionLib:MakeNotification({
				Name = "ThĂ nh cĂ´ng!",
				Content = "Code Ä‘Ă£ Ä‘Æ°á»£c copy vĂ o clipboard!",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		else
			OrionLib:MakeNotification({
				Name = "Sai Code",
				Content = "KhĂ´ng tĂ¬m tháº¥y code phĂ¹ há»£p!",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
	end
})
