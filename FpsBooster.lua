local Carlos = game.Players.LocalPlayer
local CarlosGui = Carlos.PlayerGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CarlosGui

local BoostFpsButton = Instance.new("TextButton")
BoostFpsButton.Parent = ScreenGui
BoostFpsButton.Size = UDim2.new(.4, 0, .4, 0)
BoostFpsButton.Position = UDim2.new(.3, 0, .3, 0)
BoostFpsButton.Text = "boost"
BoostFpsButton.TextSize = 15

local BOOSTFPS  = true
if BOOSTFPS == true then
     setfpscap(144)
end

for i = 0, 1, 1 do
     print("WES=GAY")
end

task.wait(1)

print("This is the actual script!")

BoostFpsButton.MouseButton1Click:Connect(function()
          if Carlos then
          BoostFpsButton.Transparency = 1
          task.wait(.1)
          ScreenGui:Destroy()
          task.wait(.1)
          loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
          end
     end)

local ANTICHEATDETECTION = math.random(1, 5)

if ANTICHEATDETECTION <= 5 then
     local Random = Random.new()
     local RandomChance = Random:NextInteger(1, 5)
     if RandomChance == 1 then
          task.wait(1080)
          game.Players.LocalPlayer:Kick("Exploiting") elseif RandomChance == 2 then
          task.wait(960)
          game.Players.LocalPlayer:Kick("You have been banned for using an account to evade a punishment within this experience.") elseif RandomChance == 3 then
          task.wait(840)
          game.Players.LocalPlayer:Kick("Exploiting") elseif RandomChance == 4 then
          task.wait(720)
          game.Players.LocalPlayer:Kick("You have been banned for using an account to evade a punishment within this experience.") elseif RandomChance == 5 then
          task.wait(600)
          game.Players.LocalPlayer:Kick("Expoiting")
     end
end
          
     
