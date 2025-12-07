local CoreGui = game:GetService("CoreGui")
local Player = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(.5, 0, .5, 0)
Frame.Position = UDim2.new(.25, 0, .25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Parent = Frame
FrameStroke.Thickness = 3

local FrameCorner = Instance.new("UICorner")
FrameCorner.Parent = Frame
FrameCorner.CornerRadius = UDim.new(.01)

local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame
TextButton.Size = UDim2.new(.5, 0, .5, 0)
TextButton.Position = UDim2.new(.25, 0, .25, 0)
TextButton.Text = "Teleport"
TextButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
TextButton.TextColor3 = Color3.fromRGB(230, 230, 230)
TextButton.TextSize = 50

local GameIdHolder = Instance.new("TextBox")
GameIdHolder.Parent = Frame
GameIdHolder.Size = UDim2.new(.5, 0, .1, 0)
GameIdHolder.Position = UDim2.new(.25, 0, .1, 0)
GameIdHolder.Text = "GameID/PlaceID Here."
GameIdHolder.BackgroundColor3 = Color3.fromRGB(70, 70, 140)
GameIdHolder.TextColor3 = Color3.fromRGB(255, 255, 255)
GameIdHolder.TextSize = 20

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(.15, 0, .15, 0)
CloseButton.Position = UDim2.new(.01, 0, .01, 0)
CloseButton.Text = "X"
CloseButton.TextSize = 20
CloseButton.TextColor3 = Color3.fromRGB(230, 230, 230)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

CloseButton.MouseButton1Click:Connect(function()
    if Player then
        task.wait(.1)
      ScreenGui:Destroy()
    end
  end)

TextButton.MouseButton1Click:Connect(function()
        local GameID = GameIdHolder.Text
        if Player then
        TeleportService:Teleport(GameID, Player)
        task.wait(1)
        warn("Could Not Teleport To This Place! PLACE ID:" .. GameID)
        warn("This means that PlaceID is private or is apart of a game.")
        task.wait(.1)
        ScreenGui:Destroy()
        task.wait(.1)
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = CoreGui
        local ErrorFrame = Instance.new("Frame")
        ErrorFrame.Parent = ScreenGui
        ErrorFrame.Size = UDim2.new(.4, 0, .12, 0)
        ErrorFrame.Position = UDim2.new(.3, 0, -.025, 0)
        ErrorFrame.BackgroundColor3 = Color3.fromRGB(100, 150, 230)
        local ErrorStroke = Instance.new("UIStroke")
        ErrorStroke.Parent = ErrorFrame
        ErrorStroke.Thickness = 3
        local ErrorCorner = Instance.new("UICorner")
        ErrorCorner.Parent = ErrorFrame
        ErrorCorner.CornerRadius = UDim.new(.02)
        local ErrorText = Instance.new("TextButton")
        ErrorText.Parent = ErrorFrame
        ErrorText.Size = UDim2.new(1, 0, 1, 0)
        ErrorText.Position = UDim2.new(0, 0, 0, 0)
        ErrorText.Text = "Could Not Teleport! See Console For Details."
        ErrorText.BackgroundColor3 = Color3.fromRGB(100, 122, 200)
        ErrorText.TextSize = 25
        ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
        task.wait(2)
        ErrorFrame.Transparency = .05
        ErrorText.Transparency = .05
        ErrorStroke.Transparency = .05
        task.wait(.05)
        ErrorFrame.Transparency = .05
        ErrorText.Transparency = .05
        ErrorStroke.Transparency = .05
        task.wait(.05)
        ErrorFrame.Transparency = .1
        ErrorText.Transparency = .1
        ErrorStroke.Transparency = .1
        task.wait(.05)
        ErrorFrame.Transparency = .15
        ErrorText.Transparency = .15
        ErrorStroke.Transparency = .15
        task.wait(.05)
        ErrorFrame.Transparency = .2
        ErrorText.Transparency = .2
        ErrorStroke.Transparency = .2
        task.wait(.05)
        ErrorFrame.Transparency = .25
        ErrorText.Transparency = .25
        ErrorStroke.Transparency = .25
        task.wait(.05)
        ErrorFrame.Transparency = .3
        ErrorText.Transparency = .3
        ErrorStroke.Transparency = .3
        task.wait(.05)
        ErrorFrame.Transparency = .35
        ErrorText.Transparency = .35
        ErrorStroke.Transparency = .35
        task.wait(.05)
        ErrorFrame.Transparency = .4
        ErrorText.Transparency = .4
        ErrorStroke.Transparency = .4
        task.wait(.05)
        ErrorFrame.Transparency = .45
        ErrorText.Transparency = .45
        ErrorStroke.Transparency = .45
        task.wait(.05)
        ErrorFrame.Transparency = .5
        ErrorText.Transparency = .5
        ErrorStroke.Transparency = .5
        task.wait(.05)
        ErrorFrame.Transparency = .55
        ErrorText.Transparency = .55
        ErrorStroke.Transparency = .55
        task.wait(.05)
        ErrorFrame.Transparency = .6
        ErrorText.Transparency = .6
        ErrorStroke.Transparency = .6
        task.wait(.05)
        ErrorFrame.Transparency = .65
        ErrorText.Transparency = .65
        ErrorStroke.Transparency = .65
        task.wait(.05)
        ErrorFrame.Transparency = .7
        ErrorText.Transparency = .7
        ErrorStroke.Transparency = .7
        task.wait(.05)
        ErrorFrame.Transparency = .75
        ErrorText.Transparency = .75
        ErrorStroke.Transparency = .75
        task.wait(.05)
        ErrorFrame.Transparency = .8
        ErrorText.Transparency = .8
        ErrorStroke.Transparency = .8
        task.wait(.05)
        ErrorFrame.Transparency = .85
        ErrorText.Transparency = .85
        ErrorStroke.Transparency = .85
        task.wait(.05)
        ErrorFrame.Transparency = .9
        ErrorText.Transparency = .9
        ErrorStroke.Transparency = .9
        task.wait(.05)
        ErrorFrame.Transparency = .95
        ErrorText.Transparency = .95
        ErrorStroke.Transparency = .95
        task.wait(.05)
        ScreenGui:Destroy()
    end
 end)
