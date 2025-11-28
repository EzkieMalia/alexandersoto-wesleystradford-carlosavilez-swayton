local Dark = game.Players.LocalPlayer
local PlayerGui =  Dark.PlayerGui

local MainScreenGui = Instance.new("ScreenGui")
MainScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = MainScreenGui
MainFrame.Size = UDim2.new(.4, 0, .5, 0)
MainFrame.Position = UDim2.new(.3, 0, .25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.Parent = MainFrame
MainFrameStroke.Thickness = 5

local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.Parent = MainFrame
MainFrameCorner.CornerRadius = UDim.new(.02)

local LoadScriptFrame = Instance.new("Frame")
LoadScriptFrame.Parent = MainFrame
LoadScriptFrame.Size = UDim2.new(.6, 0, .4, 0)
LoadScriptFrame.Position = UDim2.new(.2, 0, .3, 0)
LoadScriptFrame.BackgroundColor3 = Color3.fromRGB(25, 80, 150)

local LoadScript = Instance.new("TextButton")
LoadScript.Parent =  MainFrame
LoadScript.Size = UDim2.new(.6, 0, .4, 0)
LoadScript.Text = "Load the script.?"
LoadScript.TextSize = 40
LoadScript.Position = UDim2.new(.2, 0, .3, 0)
LoadScript.BackgroundColor3 = Color3.fromRGB(16, 122, 122)
LoadScript.BackgroundTransparency = 1

local LoadScriptStroke = Instance.new("UIStroke")
LoadScriptStroke.Parent = LoadScriptFrame
LoadScriptStroke.Thickness = 4

local LoadScriptCorner = Instance.new("UICorner")
LoadScriptCorner.Parent = LoadScriptFrame
LoadScriptCorner.CornerRadius = UDim.new(.02)

local CloseMainGUIFrame = Instance.new("Frame")
CloseMainGUIFrame.Parent = MainFrame
CloseMainGUIFrame.Size = UDim2.new(.15, 0, .15, 0)
CloseMainGUIFrame.Position = UDim2.new(.02, 0, .02, 0)
CloseMainGUIFrame.BackgroundColor3 = Color3.fromRGB(255, 25, 25)

local CloseMainGUI = Instance.new("TextButton")
CloseMainGUI.Parent = CloseMainGUIFrame
CloseMainGUI.Size = UDim2.new(1, 0, 1, 0)
CloseMainGUI.Position = UDim2.new(0, 0, 0, 0)
CloseMainGUI.BackgroundColor3 = Color3.fromRGB(255, 50, 25)
CloseMainGUI.Text = "X"
CloseMainGUI.TextSize = 67
CloseMainGUI.BackgroundTransparency = 1

local CloseMainGUIStroke = Instance.new("UIStroke")
CloseMainGUIStroke.Parent = CloseMainGUIFrame
CloseMainGUIStroke.Thickness = 4

local CloseMainGUICorner = Instance.new("UICorner")
CloseMainGUICorner.Parent = CloseMainGUIFrame
CloseMainGUICorner.CornerRadius = UDim.new(.02)

CloseMainGUI.MouseButton1Click:Connect(function()
    if Dark then
        LoadScriptFrame.Transparency = 1
        CloseMainGUIFrame.Transparency = 1
        MainFrame.Transparency = 1
        CloseMainGUI.Transparency = 1
        LoadScript.Transparency = 1
        LoadScriptStroke.Thickness = 0
        MainFrameStroke.Thickness = 0
        CloseMainGUIStroke.Thickness = 0
        task.wait(1)
        MainScreenGui:Destroy()
    end
end)

LoadScript.MouseButton1Click:Connect(function()
    if Dark then
        task.wait(.5)
        LoadScriptFrame.Transparency = 1
        CloseMainGUIFrame.Transparency = 1
        MainFrame.Transparency = 1
        CloseMainGUI.Transparency = 1
        LoadScript.Transparency = 1
        LoadScriptStroke.Thickness = 0
        MainFrameStroke.Thickness = 0
        CloseMainGUIStroke.Thickness = 0
        task.wait(.2)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EzkieMalia/alexandersoto/refs/heads/main/HpoNoHp2.lua"))()
        print("Loading.. Bypass.")
    end
end)
