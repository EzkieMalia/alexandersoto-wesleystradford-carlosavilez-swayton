local CoreGui = game:GetService("CoreGui")
local CarlosGui = CoreGui:WaitForChild("RobloxGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CarlosGui

local CrosshairFrame = Instance.new("Frame")
CrosshairFrame.Parent = ScreenGui
CrosshairFrame.Size = UDim2.new(.05, 0, .1, 0)
CrosshairFrame.Position = UDim2.new(.475, 0, .421, 0)
CrosshairFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CrosshairFrame.Visible = true

local Spoke1 = Instance.new("Frame")
Spoke1.Parent = CrosshairFrame
Spoke1.Size = UDim2.new(.025, 0, .15, 0)
Spoke1.Position = UDim2.new(.48975, 0, .275, 0)
Spoke1.BackgroundColor3 = Color3.fromRGB(255, 192, 203)

local Spoke2 = Instance.new("Frame")
Spoke2.Parent = CrosshairFrame
Spoke2.Size = UDim2.new(.15, 0, .025, 0)
Spoke2.Position = UDim2.new(.275, 0, .48975, 0)
Spoke2.BackgroundColor3 = Color3.fromRGB(255, 192, 203)

local Spoke3 = Instance.new("Frame")
Spoke3.Parent = CrosshairFrame
Spoke3.Size = UDim2.new(.025, 0, .15, 0)
Spoke3.Position = UDim2.new(.48975, 0, .575, 0)
Spoke3.BackgroundColor3 = Color3.fromRGB(255, 192, 203)

local Spoke4 = Instance.new("Frame")
Spoke4.Parent = CrosshairFrame
Spoke4.Size = UDim2.new(.15, 0, .025, 0)
Spoke4.Position = UDim2.new(.575, 0, .48975, 0)
Spoke4.BackgroundColor3 = Color3.fromRGB(255, 192, 203)

local Middle = Instance.new("Frame")
Middle.Parent = CrosshairFrame
Middle.Size = UDim2.new(.05, 0, .05, 0)
Middle.Position = UDim2.new(.475, 0, .475, 0)
Middle.BackgroundColor3 = Color3.fromRGB(255, 192, 203)

local MiddleCorner = Instance.new("UICorner")
MiddleCorner.Parent = Middle
MiddleCorner.CornerRadius = UDim.new(1.5)

task.wait(.1)

local MiddleStroke = Instance.new("UIStroke")
MiddleStroke.Parent = Middle
MiddleStroke.Thickness = 2

local stroke = Instance.new("UIStroke")
stroke.Parent = Spoke1
stroke.Thickness = 2
task.wait(.1)

local stroke2 = Instance.new("UIStroke")
stroke2.Parent = Spoke2
stroke2.Thickness = 2
task.wait(.1)

local stroke3 = Instance.new("UIStroke")
stroke3.Parent = Spoke3
stroke3.Thickness = 2
task.wait(.1)

local stroke4 = Instance.new("UIStroke")
stroke4.Parent = Spoke4
stroke4.Thickness = 2
task.wait(.1)

CrosshairFrame.Transparency = 1
