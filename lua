--MADE BY EXFTB 
print("MADE MY EXFTB")

--//SETTINGS//--
--[[

INSTRUCTIONS

Only edit true, false or the text inbetween the "" or ''



]]
local Settings = {
    AimLock = {
        Enabled = true, --set to false if you want to disable the aimbot
        Aimlockkey = "q", -- can be changed to q or e or c or v whatever you wish
        Prediction = 0.130340, --normal actually really good to be honest
        AutoPrediction = true, --if you want it to auto predict for you
        Aimpart = 'HumanoidRootPart', --UpperTorso,Humanoid,LeftArm you get it
        Notifications = true --false if you dont want notifications
    },
    Settings = {
        Thickness = 3.5,
        Transparency = 1,
        Color = Color3.fromRGB(0, 255, 171), --orange is 255, 154, 3
        FOV = true
    }

}

--//DO NOT EDIT ANYTHING UNDER THIS UNLESS YOU KNOW WHAT YOU'RE DOING.//--
if Settings.AimLock.AutoPrediction == true then
local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
local split = string.split(pingvalue,'(')
local ping = tonumber(split[1])
        if ping < 130 then
Settings.AimLock.Prediction = 0.151
        elseif ping < 120 then
Settings.AimLock.Prediction = 0.149
        elseif ping < 110 then
Settings.AimLock.Prediction = 0.146
        elseif ping < 105 then
Settings.AimLock.Prediction = 0.138
        elseif ping < 90 then
Settings.AimLock.Prediction = 0.136
        elseif ping < 80 then
Settings.AimLock.Prediction = 0.134
        elseif ping < 70 then
Settings.AimLock.Prediction = 0.130340
        elseif ping < 60 then
Settings.AimLock.Predictionn = 0.1229
        elseif ping < 50 then
Settings.AimLock.Prediction = 0.1225
        elseif ping < 40 then
Settings.AimLock.Prediction = 0.1256
   end
end

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/EXFTB/UI/main/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/EXFTB/UI-main/main/STX/Client.Lua"))()
    Notification:Notify(
    {Title = "Predict.Ware", Description = "Loaded, AutoPrediction: " ..tostring(Settings.AimLock.Prediction)},
    {OutlineColor = Color3.fromRGB(0, 255, 171),Time = 5, Type = "default"}
)

    Notification:Notify(
    {Title = "Predict.Ware", Description = "Ping: " ..game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString();},
    {OutlineColor = Color3.fromRGB(0, 255, 171),Time = 5, Type = "default"}
)

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/EXFTB/UI/main/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/EXFTB/UI-main/main/STX/Client.Lua"))()
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local RunService = game:GetService("RunService")

local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer

local Line = Drawing.new("Line")
local Circle = Drawing.new("Circle")

local Plr = game.Players.LocalPlayer

Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (Settings.AimLock.Aimlockkey) then
        if Settings.AimLock.Enabled == true then
            Settings.AimLock.Enabled = false
            if Settings.AimLock.Notifications == true then
                Plr = FindClosestPlayer()
Notification:Notify(
    {Title = "Predict.Ware", Description = "Locked on: " ..tostring(nil)},
    {OutlineColor = Color3.fromRGB(0, 255, 171),Time = 3, Type = "default"}
)
end
        else
            Plr = FindClosestPlayer()
            Settings.AimLock.Enabled = true
            if Settings.AimLock.Notifications == true then
Notification:Notify(
    {Title = "Predict.Ware", Description = "Locked on: " .. tostring(Plr.Character.Humanoid.DisplayName) },
    {OutlineColor = Color3.fromRGB(0, 255, 171),Time = 3, Type = "default"}
)
            end
        end
    end
end)

function FindClosestPlayer()
    local ClosestDistance, ClosestPlayer = math.huge, nil;
    for _, Player in next, game:GetService("Players"):GetPlayers() do
        if Player ~= LocalPlayer then
            local Character = Player.Character
            if Character and Character.Humanoid.Health > 1 then 
                local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart
                                                                                             .Position)
                if IsVisibleOnViewPort then
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                    if Distance < ClosestDistance then
                        ClosestPlayer = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return ClosestPlayer, ClosestDistance
end

RunService.Heartbeat:connect(function()
    if Settings.AimLock.Enabled == true then
        local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position +
                                                              (Plr.Character[Settings.AimLock.Aimpart].Velocity *
                                                              Settings.AimLock.Prediction))
        Line.Color = Settings.Settings.Color
        Line.Transparency = Settings.Settings .Transparency
        Line.Thickness = Settings.Settings .Thickness
        Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        Line.Visible = true
        Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Circle.Visible = Settings.Settings.FOV
        Circle.Thickness = 1.5
        Circle.Thickness = 2
        Circle.Radius = 60
        Circle.Color = Settings.Settings.Color
    elseif Settings.AimLock.FOV == true then
        Circle.Visible = true
    else
        Circle.Visible = false
        Line.Visible = false
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "MousePos" then
        args[3] = Plr.Character[Settings.AimLock.Aimpart].Position +
                      (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)

        return old(unpack(args))
    end
    return old(...)
end)

