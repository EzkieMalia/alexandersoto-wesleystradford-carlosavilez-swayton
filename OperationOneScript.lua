local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

--[[Dependencies]]
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.Camera
local CurrentCamera = Workspace.CurrentCamera
local ScreenSize = CurrentCamera.ViewportSize
local ScreenPositions = {Vector2.new(ScreenSize.X / 2, ScreenSize.Y), Vector2.new(ScreenSize.X / 2, ScreenSize.Y / 2), Vector2.new(ScreenSize.X / 2, 0)}

--[[Settings]]
local FirerateSpeed
local RecoilValue

local HeadSizeValue = 1
local HeadSizeTransparency = 0

local SilentAim = false

local EspBox = false
local EspBoxOutline = false
local EspTracer = false
local EspTracerOutline = false
local EspHealth = false
local EspHealthBarOutline = false
local EspName = false
local EspDrone = false
local EspDroneOutline = false

--[[Tables]]
local EspBoxes = {}
local EspBoxOutlines = {}
local EspTracers = {}
local EspTracerOutlines = {}
local EspHealths = {}
local EspHealthBarOutlines = {}
local EspNames = {}
local EspDrones = {}
local EspDroneOutlines = {}

--[[Remove Player Name function]]
local function RemovePlayer(name)
    if EspBoxes[name] then EspBoxes[name].Visible = false; EspBoxes[name]:Remove(); EspBoxes[name] = nil end
	if EspTracers[name] then EspTracers[name].Visible = false; EspTracers[name]:Remove(); EspTracers[name] = nil end
	if EspHealths[name] then EspHealths[name].Visible = false; EspHealths[name]:Remove(); EspHealths[name] = nil end
	if EspNames[name] then EspNames[name].Visible = false; EspNames[name]:Remove(); EspNames[name] = nil end
    if EspBoxOutlines[name] then EspBoxOutlines[name].Visible = false; EspBoxOutlines[name]:Remove(); EspBoxOutlines[name] = nil end
	if EspTracerOutlines[name] then EspTracerOutlines[name].Visible = false; EspTracerOutlines[name]:Remove(); EspTracerOutlines[name] = nil end
	if EspHealthBarOutlines[name] then EspHealthBarOutlines[name].Visible = false; EspHealthBarOutlines[name]:Remove(); EspHealthBarOutlines[name] = nil end
end

--[[Remove Players Drone function]]
local function RemovePlayerDrone(drone)
    if EspDrones[drone] then EspDrones[drone].Visible = false; EspDrones[drone]:Remove(); EspDrones[drone] = nil end
    if EspDroneOutlines[drone] then EspDroneOutlines[drone].Visible = false; EspDroneOutlines[drone]:Remove(); EspDroneOutlines[drone] = nil end
end

--[[Get Enemies function]]
local function GetEnemies()
    local Team = LocalPlayer.Team
    local Enemies = {}
    for i,v in pairs(Players:GetChildren()) do
        if v.Character and Players[v.Name].Team ~= Team then
        local Humanoid = v.Character:FindFirstChild("Humanoid")
            if Humanoid and Humanoid.Health > 0 then
                table.insert(Enemies, v.Character)
            end
        end
    end
    local Drones = {}
    for i,v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Drone" then
            table.insert(Drones, v)
        end
    end
    return Enemies, Drones
end

--[[Get Characters Minimum and Maximum function]]
local function GetCharacterMinMax(char)
    local minX, maxX = math.huge, -math.huge
    local minY, maxY = math.huge, -math.huge

    for i,v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") then
            local CFrame = v.CFrame
            local size = v.Size / 2

            local Corners = {
                Vector3.new(-size.X, -size.Y, -size.Z),
		    	Vector3.new(-size.X, -size.Y,  size.Z),
    			Vector3.new(-size.X,  size.Y, -size.Z),
	    		Vector3.new(-size.X,  size.Y,  size.Z),
	    		Vector3.new( size.X, -size.Y, -size.Z),
		    	Vector3.new( size.X, -size.Y,  size.Z),
	    		Vector3.new( size.X,  size.Y, -size.Z),
	    		Vector3.new( size.X,  size.Y,  size.Z),
           }

            for i,v in pairs(Corners) do
                local WorldPoint = CFrame:PointToWorldSpace(v)
                local ScreenPositions, OnScreen = Camera:WorldToViewportPoint(WorldPoint)
                if OnScreen then
                minX = math.min(minX, ScreenPositions.X)
				maxX = math.max(maxX, ScreenPositions.X)
				minY = math.min(minY, ScreenPositions.Y)
				maxY = math.max(maxY, ScreenPositions.Y)
                end
            end
        end
    end
    return maxX, maxY, minX, minY
end

--[[Health Bar Calculations function]]
local function HealthBarCalculations(char)
    local maxX, maxY, minX, minY = GetCharacterMinMax(char)
    local TopLeft = Vector2.new(minX, minY)

    local BoxCFrame, BoxSize = char:GetBoundingBox()
    local TopCenterWorld = BoxCFrame.Position + BoxCFrame.UpVector * (BoxSize.Y / 2)

    local CameraLeft = -Camera.CFrame.RightVector
    local p0, on0 = Camera:WorldToViewportPoint(TopCenterWorld)
    local PL, onL = Camera:WorldToViewportPoint(TopCenterWorld + CameraLeft * .3)

    if not (on0 and onL) then
        return TopLeft, TopLeft
    end
    local LOffSet = Vector2.new(PL.x - p0.X, PL.Y - p0.Y)
    local Left2D = TopLeft + LOffSet

    return TopLeft, Left2D
end

--[[Main Esp function]]
local function MainEsp(target)
	if target == nil or (not target) then
		return
	end
	if not target:IsA("Model") then
		return
	end

	local maxX, maxY, minX, minY = GetCharacterMinMax(target)
	local outline
	local box

	if EspBoxOutlines[target.Name] then
		outline = EspBoxOutlines[target.Name]
	else
		outline = Drawing.new("Square")
		outline.Visible = true
		outline.Transparency = 0.6
		outline.Color = Color3.new(0,0,0)
		outline.Thickness = 1
		outline.Filled = false
		EspBoxOutlines[target.Name] = outline
	end

	if EspBoxes[target.Name] then
		box = EspBoxes[target.Name]
	else
		box = Drawing.new("Square")
		box.Visible = true
		box.Transparency = 0.6
		box.Color = Color3.new(1,1,1)
		box.Thickness = 2
		box.Filled = false
		EspBoxes[target.Name] = box
	end

	box.Size = Vector2.new(maxX - minX, maxY - minY)
	box.Position = Vector2.new(minX, minY)

	outline.Size = Vector2.new(maxX - minX, maxY - minY)
	outline.Position = Vector2.new(minX, minY)
	local line

	if EspTracerOutlines[target.Name] then 
		outline = EspTracerOutlines[target.Name]
	else
		outline = Drawing.new("Line")
		outline.Visible = true
		outline.Color = Color3.new(0,0,0)
		outline.Thickness = 4
		EspTracerOutlines[target.Name] = outline
	end
	
	if EspTracers[target.Name] then
		line = EspTracers[target.Name]
	else
		line = Drawing.new("Line")
		line.Visible = true
		line.Color = Color3.new(1,1,1)
		line.Thickness = 1.5
		EspTracers[target.Name] = line
	end

	outline.From = ScreenPositions[2]
	line.From = ScreenPositions[2]

	outline.To = Vector2.new(minX + (maxX - minX)/2, minY) 
	line.To = Vector2.new(minX + (maxX - minX)/2, minY)

	local healthbar
    local healthtext

	if EspHealthBarOutlines[target.Name] then
		outline = EspHealthBarOutlines[target.Name]
	else
		outline = Drawing.new("Square")
		outline.Visible = true
		outline.Color = Color3.new(0,0,0)
		outline.Thickness = 6
		outline.Filled = false
		EspHealthBarOutlines[target.Name] = outline
	end

	if EspHealths[target.Name] then
		healthbar = EspHealths[target.Name]
	else
		healthbar = Drawing.new("Square")
		healthbar.Visible = true
		healthbar.Color = Color3.new(0,1,0)
		healthbar.Thickness = 4
		healthbar.Filled = true
		EspHealths[target.Name] = healthbar
	end

	local topleft, width = HealthBarCalculations(target)
	local hWidth = (topleft - width).Magnitude
	local targethealthloss = Vector2.new(0, (maxY - minY) * (1 - target.Humanoid.Health/100))

	healthbar.Size = Vector2.new(hWidth, (maxY - minY)) - targethealthloss
	healthbar.Position = Vector2.new(topleft.X - hWidth, minY) + targethealthloss

	outline.Size = Vector2.new(hWidth, (maxY - minY)) - targethealthloss
	outline.Position = Vector2.new(topleft.X - hWidth, minY) + targethealthloss

	local name

	if EspNames[target.Name] then
		name = EspNames[target.Name]
	else
		name = Drawing.new("Text")
        if EspName == true then
		name.Visible = true
        end
		name.Color = Color3.new(1,1,1)
		name.Text = target.Name
		name.Size = 18
		name.Center = true
		name.Outline = true
		name.OutlineColor = Color3.new(0,0,0)
		EspNames[target.Name] = name
	end

	name.Position = Vector2.new(minX + (maxX - minX)/2, minY - name.TextBounds.Y - 3)
    if EspName == true then
    EspNames[target.Name].Visible = true
    else
    EspNames[target.Name].Visible = false
    end
    if EspBox == true then
    EspBoxes[target.Name].Visible = true
    EspBoxOutlines[target.Name].Visible = true
    else
    EspBoxes[target.Name].Visible = false
    EspBoxOutlines[target.Name].Visible = false
    end
    if EspTracer == true then
    EspTracers[target.Name].Visible = true
    EspTracerOutlines[target.Name].Visible = true
    else
    EspTracers[target.Name].Visible = false
    EspTracerOutlines[target.Name].Visible = false
    end

	if EspBox == true then
		EspBoxes[target.Name].Visible = true
		EspBoxOutlines[target.Name].Visible = true
		else
		EspBoxes[target.Name].Visible = false
		EspBoxOutlines[target.Name].Visible = false
    end
	if EspTracer == true then
		EspTracers[target.Name].Visible = true
		EspTracerOutlines[target.Name].Visible = true
		else
		EspTracers[target.Name].Visible = false
		EspTracerOutlines[target.Name].Visible = false
	end
	if EspHealth == true then
		EspHealths[target.Name].Visible = true
		EspHealthBarOutlines[target.Name].Visible = true
		else
		EspHealths[target.Name].Visible = false
		EspHealthBarOutlines[target.Name].Visible = false
	end
	if EspName == true then
	EspNames[target.Name].Visible = true
	else
	EspNames[target.Name].Visible = false
	end
end

--[[Drone Esp function]]
local function drone_esp(target)
	if target == nil or (not target) then
		return
	end
	if not target:IsDescendantOf(game.Workspace) then
		RemovePlayerDrone(target)
		return
	end
	if not target:IsA("Model") then
		return
	end

	local maxX, maxY, minX, minY = GetCharacterMinMax(target)
	local outline

	local box

	if EspDroneOutlines[target] then
		outline = EspDroneOutlines[target]
	else
		outline = Drawing.new("Square")
		outline.Visible = true
		outline.Transparency = 0.5
		outline.Color = Color3.new(0,0,0)
		outline.Thickness = 2
		outline.Filled = false
		EspDroneOutlines[target] = outline
	end

	if EspDrones[target] then
		box = EspDrones[target]
	else
		box = Drawing.new("Square")
		box.Visible = true
		box.Transparency = 0.5
		box.Color = Color3.new(1,0,0)
		box.Thickness = 1
		box.Filled = false
		EspDrones[target] = box
	end

	box.Size = Vector2.new(maxX - minX, maxY - minY)
	box.Position = Vector2.new(minX, minY)

	outline.Size = Vector2.new(maxX - minX, maxY - minY)
	outline.Position = Vector2.new(minX, minY)

		if EspDrone == true then
		EspDrones[target].Visible = true
		EspDroneOutlines[target].Visible = true
	else
		EspDrones[target].Visible = false
		EspDroneOutlines[target].Visible = false
	end
end

--[[Player Removing function]]
Players.PlayerRemoving:Connect(function(plr)
        RemovePlayer(plr.Name)
end)

--[[Character Hook function]]
local function charhook(plr)
	local char = plr.Character
	if not char then return end
	local Humanoid = char:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		Humanoid.Died:Connect(function()
			RemovePlayer(plr.Name)
		end)
	end
end

--[[Player Added function]]
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        charhook(plr)
    end)
end)

--[[Get Players function]]
for i,v in ipairs(Players:GetPlayers()) do
    if v.Character then charhook(v)
    end
end

--[[Adding the ESP]]
RunService.RenderStepped:Connect(function()
	local enemies, drones = GetEnemies()

	local alive = {}
	for i,v in pairs(enemies) do
		alive[v.Name] = true
		MainEsp(v)
	end

	for c,d in pairs(drones) do
		drone_esp(d)
	end

	for name,_ in pairs(EspBoxes) do
		if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspBoxes) do
	if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspTracers) do
		if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspTracers) do
		if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspHealths) do
		if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspHealths) do
		if not alive[name] then RemovePlayer(name) end
	end
	for name,_ in pairs(EspNames) do
		if not alive[name] then RemovePlayer(name) end
	end

	for drone,_ in pairs(EspDrones) do
		if not drone or not drone:IsDescendantOf(game.Workspace) then
			RemovePlayerDrone(drone)
		end
	end
	for drone,_ in pairs(EspDrones) do
		if not drone or not drone:IsDescendantOf(game.Workspace) then
			RemovePlayerDrone(drone)
		end
	end
end)

--[[Modify Head function]]
local function HeadSizeModify(Character)
    if Character then print("Head found") end
    local Head = Character:WaitForChild("Head")
    RunService.RenderStepped:Connect(function()
        if HeadSizeValue == 1 then
        else
        Head.Size = Vector3.new(HeadSizeValue, HeadSizeValue, HeadSizeValue)
        Head.Transparency = HeadSizeTransparency
        Head.CanCollide = false
        end
    end)
end

--[[Hooking the character function]]
Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
    print("Character Added")
    HeadSizeModify(char)
    end)
end)

--[[Another character hook]]
for i,v in ipairs(Players:GetPlayers()) do
    if v.Character and v.Character.Head then
        HeadSizeModify(v.Character)
    end
end

--[[Modify Firerate function]]
local function ModifyFirerate(fireratesped)
    local Actors = getactors()[1]
    run_on_actor(Actors,[[
        for i,v in next, getgc(true) do
            if(typeof(v) ~= "table") then
            continue;
        end;

        local Flash = rawget(v, "flash");
        if (Flash) then
            local oldfirerate; oldfirerate = hookfunction(v.recoil_function, function(gun_table, gun_instance)
                local weapon_states = gun_table["object"]["states"];
                weapon_states.firerate:set((fireratesped))
                return oldfirerate(gun_table, gun_instance)
                end);
            end;
        end;
    ]])
end

--[[Modify Recoil function]]
local function ModifyRecoil(recoilvale)
    local Actors = getactors()[1]
    run_on_actor(Actors,[[
        for i,v in next, getgc(true) do
            if(typeof(v) ~= "table") then
            continue;
        end;

        local Flash = rawget(v, "flash");
        if (Flash) then
            local oldfirerate; oldfirerate = hookfunction(v.recoil_function, function(gun_table, gun_instance)
                local weapon_states = gun_table["object"]["states"];
                weapon_states.recoil_up:set((recoilvale))
                weapon_states.recoil_side:set((recoilvale))
                return oldfirerate(gun_table, gun_instance)
                end);
            end;
        end;
    ]])
end


--[[Rayfield Library]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--[[Rayfield Window]]
local Window = Rayfield:CreateWindow({
   Name = "Darkizz Hub",
   Icon = 0, 
   LoadingTitle = "Operation One Script",
   LoadingSubtitle = "Darkizz Hub",
   ShowText = "O1", 
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "DarkizzHub"
   },

   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = true, 
   KeySettings = {
      Title = "Darkizz Hub",
      Subtitle = "Verification Step",
      Note = "Ask Darkizz for the key.", 
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Carlos"} 
   }
})

--[[Modify Guns Tab]]
local ModifyGunsTab = Window:CreateTab("Modify Gun", "axe")

local Section = ModifyGunsTab:CreateSection("Detected by game! ⚠️")

local Button = ModifyGunsTab:CreateButton({
   Name = "Modify Firerate",
   Callback = function()
   ModifyFirerate(FirerateSpeed)
   end,
})

local Slider = ModifyGunsTab:CreateSlider({
   Name = "Firerate Speed",
   Range = {500, 5000},
   Increment = 50,
   Suffix = "Firerate",
   CurrentValue = 2000,
   Flag = "Slider1",
   Callback = function(Value)
   FirerateSpeed = Value
   end,
})

local Divider = ModifyGunsTab:CreateDivider()

local Section2 = ModifyGunsTab:CreateSection("Detected by game! ⚠️")

local Button2 = ModifyGunsTab:CreateButton({
   Name = "Modify Recoil",
   Callback = function()
   ModifyRecoil(RecoilValue)
   end,
})

local Slider2 = ModifyGunsTab:CreateSlider({
   Name = "Recoil",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Recoil",
   CurrentValue = 0,
   Flag = "Slider2",
   Callback = function(Value)
   RecoilValue = Value
   end,
})

local Divider2 = ModifyGunsTab:CreateDivider()

--[[Extra Sensory Perception Tab]]

local EspTab = Window:CreateTab("ESP", "eye")

local Section3 = EspTab:CreateSection("Esp Boxes")

local Toggle = EspTab:CreateToggle({
   Name = "Boxes",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
    EspBox = Value
   end,
})

local Divider3 = EspTab:CreateDivider()

local Section4 = EspTab:CreateSection("Esp Tracers")

local Toggle2 = EspTab:CreateToggle({
   Name = "Tracers",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
    EspTracer = Value
   end,
})

local Divider4 = EspTab:CreateDivider()

local Section5 = EspTab:CreateSection("Esp Health")

local Toggle3 = EspTab:CreateToggle({
   Name = "Health Bars",
   CurrentValue = false,
   Flag = "Toggle3",
   Callback = function(Value)
    EspHealth = Value
   end,
})

local Divider5 = EspTab:CreateDivider()

local Section6 = EspTab:CreateSection("Esp Names")

local Toggle4 = EspTab:CreateToggle({
   Name = "Names",
   CurrentValue = false,
   Flag = "Toggle4",
   Callback = function(Value)
    EspName = Value
   end,
})

local Divider6 = EspTab:CreateDivider()

local Section7 = EspTab:CreateSection("Esp Drones")

local Toggle5 = EspTab:CreateToggle({
   Name = "Drones",
   CurrentValue = false,
   Flag = "Toggle5",
   Callback = function(Value)
    EspDrone = Value
   end,
})

local Divider7 = EspTab:CreateDivider()

--[[Hitbox Expander tab]]

local HitboxTab = Window:CreateTab("Hitboxes", "user")

local Section8 = HitboxTab:CreateSection("Head Size")

local Slider3 = HitboxTab:CreateSlider({
   Name = "Head Size",
   Range = {1, 6},
   Increment = 1,
   Suffix = "Size",
   CurrentValue = 1,
   Flag = "Slider3",
   Callback = function(Value)
   HeadSizeValue = Value
   end,
})

local Section9 = HitboxTab:CreateSection("Transparency")

local Slider4 = HitboxTab:CreateSlider({
   Name = "Head Transparency",
   Range = {0, 1},
   Increment = .05,
   Suffix = "Transparency",
   CurrentValue = 0,
   Flag = "Slider4",
   Callback = function(Value)
   HeadSizeTransparency = Value
   end,
})

local Divider8 = HitboxTab:CreateDivider()

local Section10 = HitboxTab:CreateSection("Silent Aim (W.I.P) ⚠️")

local Toggle6 = HitboxTab:CreateToggle({
   Name = "Silent Aim",
   CurrentValue = false,
   Flag = "Toggle6",
   Callback = function(Value)
    SilentAim = Value
   end,
})
