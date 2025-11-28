
  

local Dark = game.Players.LocalPlayer
local PlayerGui = Dark.PlayerGui
local Dark2 =  true

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

print("#----------||---------#")
task.wait(.1)
print("##---------||---------##")
task.wait(.1)
print("###--------||--------###")
task.wait(.1)
print("####-------||-------####")
task.wait(.1)
print("#####------||------#####")
task.wait(.1)
print("######-----||-----######")
task.wait(.1)
print("#######----||----#######")
task.wait(.1)
print("########---||---########")
task.wait(.1)
print("#########--||--#########")
task.wait(.1)
print("##########-||-##########")
task.wait(.1)
print("###########--###########")
task.wait(.1)
print("########################")
task.wait(.1)
print("Sucessfully Loaded Script.")
task.wait(.5)
print("WAIT FOR EVERYTHING TO LOAD. ~1 MINUTE.")

task.wait(.2)
for i = 0, 100000, 1 do
  print("..Loading..NOERROR.")
end

task.wait(5)
for i = 0, 100000, 1 do
  print("FIRST LOAD.. COMPLETE. START LOAD FULL.")
end

task.wait(5)
for i = 0, 100000, 1 do
  print("Request... ACCEPTED.")
end

task.wait(30)
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0.5, 0, 0.5, 0)
Frame.Position = UDim2.new(.25, 0, .25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Parent = Frame
FrameStroke.Thickness = 2

local FrameCorner = Instance.new("UICorner")
FrameCorner.Parent = Frame
FrameCorner.CornerRadius = UDim.new(.01)

task.wait(2)
local KickChoice = math.random(1, 2)

if KickChoice == 1 then
game.Players.LocalPlayer:Kick("You created or used an account to avoid an enforcement action taken against another account within this experience")
else
game.Players.LocalPlayer:Kick("You have been permanently banned for exploiting")
end
















