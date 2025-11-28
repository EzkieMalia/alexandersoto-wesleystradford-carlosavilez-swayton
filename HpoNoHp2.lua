
  

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

task.wait(7.5)
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
ScreenGui:Destroy()
task.wait(.5)
loadstring(request({Url='https://raw.githubusercontent.com/mainstreamed/amongus-hook/main/mainloader.lua'; Method='GET'}).Body)();
















