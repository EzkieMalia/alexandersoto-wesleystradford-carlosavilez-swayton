local CoreGui = game:GetService("CoreGui")
local Player = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")

local function TeleporterGUI()
local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Parent = CoreGui

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui

local UIAspect = Instance.new("UIAspectRatioConstraint")
UIAspect.Parent = ScreenGui1

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui1
Frame.Size = UDim2.new(.5, 0, .5, 0)
Frame.Position = UDim2.new(.25, 0, .25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

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

local RandomGameID = Instance.new("TextButton")
RandomGameID.Parent = Frame
RandomGameID.Size = UDim2.new(.5, 0, .1, 0)
RandomGameID.Position = UDim2.new(.25, 0, .775, 0)
RandomGameID.Text = "Generate Random PlaceID/GameID"
RandomGameID.TextSize = 20
RandomGameID.TextColor3 = Color3.fromRGB(230, 230, 230)
RandomGameID.BackgroundColor3 = Color3.fromRGB(0, 50, 100)

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(.15, 0, .15, 0)
CloseButton.Position = UDim2.new(.01, 0, .01, 0)
CloseButton.Text = "X"
CloseButton.TextSize = 20
CloseButton.TextColor3 = Color3.fromRGB(230, 230, 230)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

RandomGameID.MouseButton1Click:Connect(function()
    local RandomSeed2 = Random.new(os.time())
    if Player then
        GameIdHolder.Text = RandomSeed2:NextInteger(0, 10^10)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    if Player then
        task.wait(.1)
      ScreenGui1:Destroy()
    end
  end)

TextButton.MouseButton1Click:Connect(function()
        local GameID = GameIdHolder.Text
        local Number = 0
        local function Error12()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = CoreGui
        local UIAspect = Instance.new("UIAspectRatioConstraint")
        UIAspect.Parent = ScreenGui
        local ErrorFrame = Instance.new("Frame")
        ErrorFrame.Parent = ScreenGui
        ErrorFrame.Size = UDim2.new(.4, 0, .05, 0)
        ErrorFrame.Position = UDim2.new(.3, 0, -.025, 0)
        ErrorFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        local ErrorStroke = Instance.new("UIStroke")
        ErrorStroke.Parent = ErrorFrame
        ErrorStroke.Thickness = 4
        local ErrorCorner = Instance.new("UICorner")
        ErrorCorner.Parent = ErrorFrame
        ErrorCorner.CornerRadius = UDim.new(.02)
        local ErrorText = Instance.new("TextButton")
        ErrorText.Parent = ErrorFrame
        ErrorText.Size = UDim2.new(1, 0, 1, 0)
        ErrorText.Position = UDim2.new(0, 0, 0, 0)
        ErrorText.BackgroundTransparency = 1
        ErrorText.Text = "Could Not Teleport! See Console For Details."
        ErrorText.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        ErrorText.TextSize = 25
        ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
        local ErrorTextStroke = Instance.new("UIStroke")
        ErrorTextStroke.Parent = ErrorText
        ErrorTextStroke.Thickness = 1.5
        task.wait(1.5)
        ErrorFrame.Transparency = .05
        ErrorText.Transparency = .05
        ErrorStroke.Transparency = .05
        ErrorTextStroke.Transparency = .05
        task.wait(.05)
        ErrorFrame.Transparency = .1
        ErrorText.Transparency = .1
        ErrorStroke.Transparency = .1
        ErrorTextStroke.Transparency = .10
        task.wait(.05)
        ErrorFrame.Transparency = .15
        ErrorText.Transparency = .15
        ErrorStroke.Transparency = .15
        ErrorTextStroke.Transparency = .15
        task.wait(.05)
        ErrorFrame.Transparency = .2
        ErrorText.Transparency = .2
        ErrorStroke.Transparency = .2
        ErrorTextStroke.Transparency = .2
        task.wait(.05)
        ErrorFrame.Transparency = .25
        ErrorText.Transparency = .25
        ErrorStroke.Transparency = .25
        ErrorTextStroke.Transparency = .25
        task.wait(.05)
        ErrorFrame.Transparency = .3
        ErrorText.Transparency = .3
        ErrorStroke.Transparency = .3
        ErrorTextStroke.Transparency = .3
        task.wait(.05)
        ErrorFrame.Transparency = .35
        ErrorText.Transparency = .35
        ErrorStroke.Transparency = .35
        ErrorTextStroke.Transparency = .35
        task.wait(.05)
        ErrorFrame.Transparency = .4
        ErrorText.Transparency = .4
        ErrorStroke.Transparency = .4
        ErrorTextStroke.Transparency = .4
        task.wait(.05)
        ErrorFrame.Transparency = .45
        ErrorText.Transparency = .45
        ErrorStroke.Transparency = .45
        ErrorTextStroke.Transparency = .45
        task.wait(.05)
        ErrorFrame.Transparency = .5
        ErrorText.Transparency = .5
        ErrorStroke.Transparency = .5
        ErrorTextStroke.Transparency = .5
        task.wait(.05)
        ErrorFrame.Transparency = .55
        ErrorText.Transparency = .55
        ErrorStroke.Transparency = .55
        ErrorTextStroke.Transparency = .55
        task.wait(.05)
        ErrorFrame.Transparency = .6
        ErrorText.Transparency = .6
        ErrorStroke.Transparency = .6
        ErrorTextStroke.Transparency = .6
        task.wait(.05)
        ErrorFrame.Transparency = .65
        ErrorText.Transparency = .65
        ErrorStroke.Transparency = .65
        ErrorTextStroke.Transparency = .65
        task.wait(.05)
        ErrorFrame.Transparency = .7
        ErrorText.Transparency = .7
        ErrorStroke.Transparency = .7
        ErrorTextStroke.Transparency = .7
        task.wait(.05)
        ErrorFrame.Transparency = .75
        ErrorText.Transparency = .75
        ErrorStroke.Transparency = .75
        ErrorTextStroke.Transparency = .75
        task.wait(.05)
        ErrorFrame.Transparency = .8
        ErrorText.Transparency = .8
        ErrorStroke.Transparency = .8
        ErrorTextStroke.Transparency = .8
        task.wait(.05)
        ErrorFrame.Transparency = .85
        ErrorText.Transparency = .85
        ErrorStroke.Transparency = .85
        ErrorTextStroke.Transparency = .85
        task.wait(.05)
        ErrorFrame.Transparency = .9
        ErrorText.Transparency = .9
        ErrorStroke.Transparency = .9
        ErrorTextStroke.Transparency = .9
        task.wait(.05)
        ErrorFrame.Transparency = .95
        ErrorText.Transparency = .95
        ErrorStroke.Transparency = .95
        ErrorTextStroke.Transparency = .95
        task.wait(.05)
        ScreenGui:Destroy()
        end
        if GameID == Number then
        ScreenGui1:Destroy()
        Error12()
        warn("Please put a GameID/PlaceID inside of the TextBox.")
        else
        if GameIdHolder.Text == "GameID/PlaceID Here." then
        ScreenGui1:Destroy()
        Error12()
        warn("Please put a GameID/PlaceID inside of the TextBox.")
        else
        if Player then
        TeleportService:Teleport(GameID, Player)
        ScreenGui1:Destroy()
        ScreenGui:Destroy()
        task.wait(2)
        warn("Could Not Teleport To This Place! PLACE ID:" .. GameID)
        warn("This means that PlaceID is private or is apart of a game.")
        task.wait(.1)
        Error12()
        end
        end
    end
 end)
end

local ScreenGui1 = Instance.new("ScreenGui")
ScreenGui1.Parent = CoreGui

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui

local UIAspect2 = Instance.new("UIAspectRatioConstraint")
UIAspect2.Parent = ScreenGui

local UIAspect = Instance.new("UIAspectRatioConstraint")
UIAspect.Parent = ScreenGui1

local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui1
Frame.Size = UDim2.new(.5, 0, .5, 0)
Frame.Position = UDim2.new(.25, 0, .25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local TeleporterToggler = Instance.new("Frame")
TeleporterToggler.Parent = ScreenGui
TeleporterToggler.Size = UDim2.new(.175, 0, .06, 0)
TeleporterToggler.Position = UDim2.new(0.01, 0, .4, 0)
TeleporterToggler.BackgroundColor3 = Color3.fromRGB(67, 67, 67)

local TPSTROKE = Instance.new("UIStroke")
TPSTROKE.Parent = TeleporterToggler
TPSTROKE.Thickness = 1.5

local TPCORNER = Instance.new("UICorner")
TPCORNER.Parent = TeleporterToggler
TPCORNER.CornerRadius = UDim.new(.05)

local TPTEXT = Instance.new("TextButton")
TPTEXT.Parent = TeleporterToggler
TPTEXT.Size = UDim2.new(1, 0, 1, 0)
TPTEXT.Position = UDim2.new(0, 0, 0, 0)
TPTEXT.Text = "Open Teleporter GUI"
TPTEXT.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
TPTEXT.TextColor3 = Color3.fromRGB(255, 255, 255)
TPTEXT.TextSize = 20

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

local RandomGameID = Instance.new("TextButton")
RandomGameID.Parent = Frame
RandomGameID.Size = UDim2.new(.5, 0, .1, 0)
RandomGameID.Position = UDim2.new(.25, 0, .775, 0)
RandomGameID.Text = "Generate Random PlaceID/GameID"
RandomGameID.TextSize = 20
RandomGameID.TextColor3 = Color3.fromRGB(230, 230, 230)
RandomGameID.BackgroundColor3 = Color3.fromRGB(0, 50, 100)

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(.15, 0, .15, 0)
CloseButton.Position = UDim2.new(.01, 0, .01, 0)
CloseButton.Text = "X"
CloseButton.TextSize = 20
CloseButton.TextColor3 = Color3.fromRGB(230, 230, 230)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

RandomGameID.MouseButton1Click:Connect(function()
    local RandomSeed2 = Random.new(os.time())
    if Player then
        GameIdHolder.Text = RandomSeed2:NextInteger(0, 10^10)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    if Player then
        task.wait(.1)
      ScreenGui1:Destroy()
    end
  end)

TextButton.MouseButton1Click:Connect(function()
        local GameID = GameIdHolder.Text
        local Number = 0
        local function Error12()
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Parent = CoreGui
        local UIAspect = Instance.new("UIAspectRatioConstraint")
        UIAspect.Parent = ScreenGui
        local ErrorFrame = Instance.new("Frame")
        ErrorFrame.Parent = ScreenGui
        ErrorFrame.Size = UDim2.new(.4, 0, .05, 0)
        ErrorFrame.Position = UDim2.new(.3, 0, -.025, 0)
        ErrorFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        local ErrorStroke = Instance.new("UIStroke")
        ErrorStroke.Parent = ErrorFrame
        ErrorStroke.Thickness = 4
        local ErrorCorner = Instance.new("UICorner")
        ErrorCorner.Parent = ErrorFrame
        ErrorCorner.CornerRadius = UDim.new(.02)
        local ErrorText = Instance.new("TextButton")
        ErrorText.Parent = ErrorFrame
        ErrorText.Size = UDim2.new(1, 0, 1, 0)
        ErrorText.Position = UDim2.new(0, 0, 0, 0)
        ErrorText.BackgroundTransparency = 1
        ErrorText.Text = "Could Not Teleport! See Console For Details."
        ErrorText.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        ErrorText.TextSize = 25
        ErrorText.TextColor3 = Color3.fromRGB(255, 255, 255)
        local ErrorTextStroke = Instance.new("UIStroke")
        ErrorTextStroke.Parent = ErrorText
        ErrorTextStroke.Thickness = 1.5
        task.wait(1.5)
        ErrorFrame.Transparency = .05
        ErrorText.Transparency = .05
        ErrorStroke.Transparency = .05
        ErrorTextStroke.Transparency = .05
        task.wait(.05)
        ErrorFrame.Transparency = .1
        ErrorText.Transparency = .1
        ErrorStroke.Transparency = .1
        ErrorTextStroke.Transparency = .10
        task.wait(.05)
        ErrorFrame.Transparency = .15
        ErrorText.Transparency = .15
        ErrorStroke.Transparency = .15
        ErrorTextStroke.Transparency = .15
        task.wait(.05)
        ErrorFrame.Transparency = .2
        ErrorText.Transparency = .2
        ErrorStroke.Transparency = .2
        ErrorTextStroke.Transparency = .2
        task.wait(.05)
        ErrorFrame.Transparency = .25
        ErrorText.Transparency = .25
        ErrorStroke.Transparency = .25
        ErrorTextStroke.Transparency = .25
        task.wait(.05)
        ErrorFrame.Transparency = .3
        ErrorText.Transparency = .3
        ErrorStroke.Transparency = .3
        ErrorTextStroke.Transparency = .3
        task.wait(.05)
        ErrorFrame.Transparency = .35
        ErrorText.Transparency = .35
        ErrorStroke.Transparency = .35
        ErrorTextStroke.Transparency = .35
        task.wait(.05)
        ErrorFrame.Transparency = .4
        ErrorText.Transparency = .4
        ErrorStroke.Transparency = .4
        ErrorTextStroke.Transparency = .4
        task.wait(.05)
        ErrorFrame.Transparency = .45
        ErrorText.Transparency = .45
        ErrorStroke.Transparency = .45
        ErrorTextStroke.Transparency = .45
        task.wait(.05)
        ErrorFrame.Transparency = .5
        ErrorText.Transparency = .5
        ErrorStroke.Transparency = .5
        ErrorTextStroke.Transparency = .5
        task.wait(.05)
        ErrorFrame.Transparency = .55
        ErrorText.Transparency = .55
        ErrorStroke.Transparency = .55
        ErrorTextStroke.Transparency = .55
        task.wait(.05)
        ErrorFrame.Transparency = .6
        ErrorText.Transparency = .6
        ErrorStroke.Transparency = .6
        ErrorTextStroke.Transparency = .6
        task.wait(.05)
        ErrorFrame.Transparency = .65
        ErrorText.Transparency = .65
        ErrorStroke.Transparency = .65
        ErrorTextStroke.Transparency = .65
        task.wait(.05)
        ErrorFrame.Transparency = .7
        ErrorText.Transparency = .7
        ErrorStroke.Transparency = .7
        ErrorTextStroke.Transparency = .7
        task.wait(.05)
        ErrorFrame.Transparency = .75
        ErrorText.Transparency = .75
        ErrorStroke.Transparency = .75
        ErrorTextStroke.Transparency = .75
        task.wait(.05)
        ErrorFrame.Transparency = .8
        ErrorText.Transparency = .8
        ErrorStroke.Transparency = .8
        ErrorTextStroke.Transparency = .8
        task.wait(.05)
        ErrorFrame.Transparency = .85
        ErrorText.Transparency = .85
        ErrorStroke.Transparency = .85
        ErrorTextStroke.Transparency = .85
        task.wait(.05)
        ErrorFrame.Transparency = .9
        ErrorText.Transparency = .9
        ErrorStroke.Transparency = .9
        ErrorTextStroke.Transparency = .9
        task.wait(.05)
        ErrorFrame.Transparency = .95
        ErrorText.Transparency = .95
        ErrorStroke.Transparency = .95
        ErrorTextStroke.Transparency = .95
        task.wait(.05)
        ScreenGui:Destroy()
        end
        if GameID == Number then
        ScreenGui1:Destroy()
        Error12()
        warn("Please put a GameID/PlaceID inside of the TextBox.")
        else
        if GameIdHolder.Text == "GameID/PlaceID Here." then
        ScreenGui1:Destroy()
        Error12()
        warn("Please put a GameID/PlaceID inside of the TextBox.")
        else
        if Player then
        TeleportService:Teleport(GameID, Player)
        ScreenGui1:Destroy()
        ScreenGui:Destroy()
        task.wait(2)
        warn("Could Not Teleport To This Place! PLACE ID:" .. GameID)
        warn("This means that PlaceID is private or is apart of a game.")
        task.wait(.1)
        Error12()
        end
        end
    end
 end)

TPTEXT.MouseButton1Click:Connect(function()
    TeleporterGUI()
end)
