--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local function fuhenvlogging1()
    local ok, passed =
        pcall(
        function()
            local fps = workspace:GetRealPhysicsFPS()
            if type(fps) ~= "number" then
                return false
            end
            if fps ~= fps then
                return false
            end
            if fps <= 0.1 then
                return false
            end
            if fps > 500 then
                return false
            end
            return true
        end
    )
    if not (ok and passed) then
        warn("\n Auth 1\n Auth 2\n Protected By VultureStack")
        pcall(
            function()
                local env = getfenv(0)
                for key in pairs(env) do
                    env[key] = nil
                end
            end
        )
        return true
    end
    return false
end
if fuhenvlogging1() then
    return
end

local success, result =
    pcall(
    function()
        game:GetService("ScriptContext"):SetTimeout(1)
    end
)
pcall(
    function()
        local dummyPart = Instance.new("Part")
        for _, tbl in pairs(getreg()) do
            if type(tbl) == "table" and #tbl > 0 then
                if rawget(tbl, "__mode") == "kvs" then
                    for key, value in pairs(tbl) do
                        if value == dummyPart then
                            getgenv().InstanceList = tbl
                            break
                        end
                    end
                end
            end
        end
        local utils = {}
        function utils.invalidate(instance)
            if not InstanceList then
                return
            end
            for key, value in pairs(InstanceList) do
                if value == instance then
                    InstanceList[key] = nil
                    return instance
                end
            end
        end
        if not cloneref then
            getgenv().cloneref = newcclosure(utils.invalidate)
        end
    end
)
local oldFunc
do
    oldFunc =
        hookfunction(
        (getrenv and getrenv() or _G).getfenv,
        newcclosure(
            function(arg)
                if oldFunc(arg) == oldFunc(0) and not checkcaller() then
                    return nil
                end
                return oldFunc(arg)
            end
        )
    )
end
for _, value in pairs(getgc(true)) do
    if typeof(value) == "table" then
        if
            rawget(value, "indexInstance") or rawget(value, "newindexInstance") or rawget(value, "namecallInstance") or
                rawget(value, "newIndexInstance")
         then
            value.tvk = {
                "kick",
                function()
                    return task.wait(387420489)
                end
            }
        end
    end
end
local Old
Old =
    hookmetamethod(
    game,
    "__namecall",
    newcclosure(
        function(self, ...)
            local getcall = getnamecallmethod()
            local args = {
                ...
            }
            if self == me then
                if not checkcaller() then
                    if getcall == "Kick" then
                        return task.wait(387420489)
                    end
                    if getcall == "Destroy" then
                        return task.wait(387420489)
                    end
                end
            end
            return Old(self, ...)
        end
    )
)
task.spawn(
    function()
        repeat
            task.wait()
        until game:IsLoaded()
        local Amplitude = 200
        local RandomValue = {
            -200,
            200
        }
        local RandomTime = {
            .1,
            1
        }
        local floor = math.floor
        local cos = math.cos
        local sin = math.sin
        local acos = math.acos
        local pi = math.pi
        local Maxima = 0
        while task.wait() do
            if gcinfo() >= Maxima then
                Maxima = gcinfo()
            else
                break
            end
        end
        task.wait(0.30)
        local OldGcInfo = gcinfo() + Amplitude
        local tick = 0
        local function getreturn()
            local Formula = ((acos(cos(pi * (tick))) / pi * (Amplitude * 2)) + -Amplitude)
            return floor(OldGcInfo + Formula)
        end
        local Old
        Old =
            hookfunction(
            (getrenv and getrenv() or _G).gcinfo,
            newcclosure(
                function(...)
                    return getreturn()
                end
            )
        )
        local Old2
        Old2 =
            hookfunction(
            (getrenv and getrenv() or _G).collectgarbage,
            newcclosure(
                function(arg, ...)
                    local suc, err = pcall(Old2, arg, ...)
                    if suc and arg == "count" then
                        return getreturn()
                    end
                    return Old2(arg, ...)
                end
            )
        )
        game:GetService("RunService").Stepped:Connect(
            function()
                local Formula = ((acos(cos(pi * (tick))) / pi * (Amplitude * 2)) + -Amplitude)
                if Formula > ((acos(cos(pi * (tick) + .01)) / pi * (Amplitude * 2)) + -Amplitude) then
                    tick = tick + .07
                else
                    tick = tick + 0.01
                end
            end
        )
        local old1 = Amplitude
        for i, v in next, RandomTime do
            RandomTime[i] = v * 10000
        end
        local RandomTimeValue = math.random(RandomTime[1], RandomTime[2]) / 10000
        while wait(RandomTime) do
            Amplitude = math.random(old1 + RandomValue[1], old1 + RandomValue[2])
            RandomTimeValue = math.random(RandomTime[1], RandomTime[2]) / 10000
        end
    end
)
task.spawn(
    function()
        repeat
            task.wait()
        until game:IsLoaded()
        local RunService = cloneref(game:GetService("RunService"))
        local Stats = cloneref(game:GetService("Stats"))
        local CurrMem = Stats:GetTotalMemoryUsageMb()
        local Rand = 0
        RunService.Stepped:Connect(
            function()
                local random = Random.new()
                Rand = random:NextNumber(-10, 10)
            end
        )
        local function GetReturn()
            return CurrMem + Rand
        end
        local _MemBypass
        _MemBypass =
            hookmetamethod(
            game,
            "__namecall",
            newcclosure(
                function(self, ...)
                    local method = getnamecallmethod()
                    if not checkcaller() then
                        if
                            typeof(self) == "Instance" and
                                (method == "GetTotalMemoryUsageMb" or method == "getTotalMemoryUsageMb") and
                                self.ClassName == "Stats"
                         then
                            return GetReturn()
                        end
                    end
                    return _MemBypass(self, ...)
                end
            )
        )
        local _MemBypassIndex
        _MemBypassIndex =
            hookfunction(
            Stats.GetTotalMemoryUsageMb,
            newcclosure(
                function(self, ...)
                    if not checkcaller() then
                        if typeof(self) == "Instance" and self.ClassName == "Stats" then
                            return GetReturn()
                        end
                    end
                end
            )
        )
    end
)
task.spawn(
    function()
        repeat
            task.wait()
        until game:IsLoaded()
        local RunService = cloneref(game:GetService("RunService"))
        local Stats = cloneref(game:GetService("Stats"))
        local CurrMem = Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui)
        local Rand = 0
        RunService.Stepped:Connect(
            function()
                local random = Random.new()
                Rand = random:NextNumber(-0.1, 0.1)
            end
        )
        local function GetReturn()
            return CurrMem + Rand
        end
        local _MemBypass
        _MemBypass =
            hookmetamethod(
            game,
            "__namecall",
            newcclosure(
                function(self, ...)
                    local method = getnamecallmethod()
                    if not checkcaller() then
                        if
                            typeof(self) == "Instance" and
                                (method == "GetMemoryUsageMbForTag" or method == "getMemoryUsageMbForTag") and
                                self.ClassName == "Stats"
                         then
                            return GetReturn()
                        end
                    end
                    return _MemBypass(self, ...)
                end
            )
        )
        local _MemBypassIndex
        _MemBypassIndex =
            hookfunction(
            Stats.GetMemoryUsageMbForTag,
            newcclosure(
                function(self, ...)
                    if not checkcaller() then
                        if typeof(self) == "Instance" and self.ClassName == "Stats" then
                            return GetReturn()
                        end
                    end
                end
            )
        )
    end
)
local Content = cloneref(game:GetService("ContentProvider"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local randomizedCoreGuiTable
local randomizedGameTable
local coreguiTable = {}
game:GetService("ContentProvider"):PreloadAsync(
    {
        CoreGui
    },
    function(assetId)
        if not assetId:find("rbxassetid://") then
            table.insert(coreguiTable, assetId)
        end
    end
)
local gameTable = {}
for i, v in pairs(game:GetDescendants()) do
    if v:IsA("ImageLabel") then
        if v.Image:find("rbxassetid://") and v:IsDescendantOf(CoreGui) then
        else
            table.insert(gameTable, v.Image)
        end
    end
end
function randomizeTable(t)
    local n = #t
    while n > 0 do
        local k = math.random(n)
        t[n], t[k] = t[k], t[n]
        n = n - 1
    end
    return t
end
local ContentProviderBypass
ContentProviderBypass =
    hookmetamethod(
    game,
    "__namecall",
    newcclosure(
        function(self, Instances, ...)
            local method = getnamecallmethod()
            local args = ...
            if not checkcaller() and (method == "preloadAsync" or method == "PreloadAsync") then
                if Instances and Instances[1] and self.ClassName == "ContentProvider" then
                    if Instances ~= nil then
                        if
                            typeof(Instances[1]) == "Instance" and
                                (table.find(Instances, CoreGui) or table.find(Instances, game))
                         then
                            if Instances[1] == CoreGui then
                                randomizedCoreGuiTable = randomizeTable(coreguiTable)
                                return ContentProviderBypass(self, randomizedCoreGuiTable, ...)
                            end
                            if Instances[1] == game then
                                randomizedGameTable = randomizeTable(gameTable)
                                return ContentProviderBypass(self, randomizedGameTable, ...)
                            end
                        end
                    end
                end
            end
            return ContentProviderBypass(self, Instances, ...)
        end
    )
)
local preloadBypass
preloadBypass =
    hookfunction(
    Content.PreloadAsync,
    newcclosure(
        function(a, b, c)
            if not checkcaller() then
                if typeof(a) == "Instance" and tostring(a) == "ContentProvider" and typeof(b) == "table" then
                    if
                        (table.find(b, CoreGui) or table.find(b, game)) and
                            not (table.find(b, true) or table.find(b, false))
                     then
                        if b[1] == CoreGui then
                            randomizedCoreGuiTable = randomizeTable(coreguiTable)
                            return preloadBypass(a, randomizedCoreGuiTable, c)
                        end
                        if b[1] == game then
                            randomizedGameTable = randomizeTable(gameTable)
                            return preloadBypass(a, randomizedGameTable, c)
                        end
                    end
                end
            end
            return preloadBypass(a, b, c)
        end
    )
)
local TableNumbaor001 = {}
local SomethingOld
SomethingOld =
    hookfunction(
    (getrenv and getrenv() or _G).newproxy,
    newcclosure(
        function(...)
            local proxy = SomethingOld(...)
            table.insert(TableNumbaor001, proxy)
            return proxy
        end
    )
)

local RunService = cloneref(game:GetService("RunService"))
RunService.Stepped:Connect(
    function()
        for i, v in pairs(TableNumbaor001) do
            if v == nil then
            end
        end
    end
)

local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

if string.find(executor, "Xeno") or string.find(executor, "Solara") then

    LocalPlayer:Kick("shitty executor detected")
    return
end

local Ox4 = ...

local function validateKey(Ox4)
    local validKeys = {
        "x9f3Kq72LmZ8pQ4vT1aW0rE6YhC5uJbNsD8gH2F7kPqXzR3mV9tLQ7nP2zV8cX4aB6dE9fG1hJ3kL5mN8pQwR7tY2uI5oP8sD",
        "dLN7dPaXvnIy0romgrEQKxwWqwbXnocbrkGGnbOhyy9dx8fVDFZfOowmKRsW51jRyqDoKGujfWrI1EwNUmpK4rPrHvze9hk7P",
        "RQq3XuUvyCXGpDEnkRUYY8PTpeGg4eyVY6szirqyMLnhxkf7umzyLo8HwWBXUeIwQXBi6MV84gZEgWQPdRXMO5v7nIDaJTV52",
        "cFtGjZNSVTqPOHtuHR7WDe3pANIe2Cc7m3gQ6wBrFWZ9bh3fb9YetqPFjuthiaenx4L7Zqqb43KS0pOj6ftDnPmFzBazGMy1a",
        "DYBG5vg6L1SEppf0OHRodCq2oTG33muhBSiwmCt6pvx9m0TjnBEcxLK32RTyGcfvNoIQcJstTy4MHmOFeKxXt0gzp3d2HJuxm",
        "WXV6EB9mWygFSdF4afmNvA4ZcleaRVDiErzv3tvUvPf9XPpDWrkNxKJDb4xs2ED7hiC4VigPA3o4sgzNjakjBQWaREwA143tL",
        "JG7q947UZgGlcxO7r49Z4Wmr3L39jc9gKSXeRtYAi1dcNn5J4bnTfTvF2nx7j1RwvzFrDaL714WwhqSft56cjWvSLvriauJOk",
        "J1E23IT8oWNcidtCsARmAFzYWu9Nv5u3HMdVp2J2ABHZ3zaFLTmqP0Bx7zqNiNH0lrdNaQCUZgtvXLgcNBVGbQzRwfy8TmBJI",
    }

    for _, key in ipairs(validKeys) do
        if Ox4 == key then
            return true
        end
    end

    return false
end

if validateKey(Ox4) then

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

--Load The UI Library                                                                    
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"--          
  local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()--                      
  local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()--     
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()--       
--Load The Save Manager & Theme Manager                                             

local Window = Library:CreateWindow({
	Title = "Welcome To VultureStack",
    Footer = "V U L K A N | A N A R C H Y",
	Icon = 117645676598907, -- 117389880230870 [Profile invalid one]  -- 126474730751372 [VultureStack White]  -- 117645676598907 [VultureStack RedTrack]  -- 107012847585926 [VultureStack MagTrack]
    GlobalSearch = false,
    Compact = false,
    EnableSidebarResize = true,
    CornerRadius = 18,
	NotifySide = "Right",
	ShowCustomCursor = false,
    Size = UDim2.fromOffset(995, 845)
})

local Options = Library.Options
     local Toggles = Library.Toggles 

local Tabs = {
    ["Home"] = Window:AddTab("VultureStack Home Information", "asterisk"),
    ["Character"] = Window:AddTab("VultureStack Character", "asterisk"),
    ["Combat"] = Window:AddTab("VultureStack Combat", "asterisk"),
    ["Lighting"] = Window:AddTab("VultureStack Visuals", "asterisk"),
    ["Keybinds"] = Window:AddTab("VultureStack Keybinds", "asterisk"),
    ["UI Settings"] = Window:AddTab("VultureStack User Interface", "asterisk"),
}

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local HomeTab = Tabs.Home

local ChangelogTabBox = HomeTab:AddRightTabbox("Changelogs")

local AdditionsTab = ChangelogTabBox:AddTab("Additions")

local RemovalsTab = ChangelogTabBox:AddTab("Removals")

local RightTabBox = Tabs["UI Settings"]:AddRightTabbox("Keybinds")

local MenuTab = RightTabBox:AddTab("Interface")

local WatermarkTab = RightTabBox:AddTab("Watermark")

HomeLeft  = HomeTab:AddLeftGroupbox(" ")

MainFeedback   = HomeTab:AddLeftGroupbox("Feedback System", "mail")

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local CharTab = Tabs.Character

local CombatTab = Tabs.Combat

local VisualsTab = Tabs.Lighting

local KeybindsTab = Tabs.Keybinds

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK DEMO
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local Image = HomeLeft:AddImage("MyAgaImage", {
    Image = "rbxassetid://73892009848590", -- 76785310241386 [X7Z WhiteTrack]  -- 73892009848590 [X7Z RedTrack]  --138676040549024 [X7Z MagTrack]
    Transparency = 0.1,
    Color = Color3.new(1, 1, 1),
    RectOffset = Vector2.zero,
    RectSize = Vector2.zero,
    ScaleType = Enum.ScaleType.Fit,
    Height = 350,
})

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULKAN FEEDBACK SYSTEM
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local LocalPlayer = Players.LocalPlayer

-- replace with your webhook
local WEBHOOK_URL = "https://ptb.discord.com/api/webhooks/1459689227271802944/aRenJvd8J11ckGumHPTh44KPHPYAxHrOjAPwfS92XxHPSpPO0fhjXFpANY5HWytCBM0Q"

local function getCurrentGame()
    local placeId = game.PlaceId
    local gameId = game.GameId
    local info = MarketplaceService:GetProductInfo(placeId)

    return {
        Name = info.Name or "Unknown",
        GameId = gameId,
        PlaceId = placeId
    }
end

local FEEDBACK_COOLDOWN = 500 -- secs
local lastFeedbackTime = 0

MainFeedback:AddInput("FeedbackInput", {
    Text = "Feedback Message:",
    Placeholder = "Type feedback message here...",
    Default = "",
    Multiline = true,
    MaxLength = 500,
})

MainFeedback:AddButton({
    Text = "Send Feedback",
    Func = function()
        local currentTime = tick()
        if currentTime - lastFeedbackTime < FEEDBACK_COOLDOWN then
            local remaining = math.ceil(FEEDBACK_COOLDOWN - (currentTime - lastFeedbackTime))
            Library:Notify({
                Title = "Cooldown Active",
                Description = "Wait " .. remaining .. " seconds before sending feedback",
                Time = 4
            })
            return
        end

        local message = Options.FeedbackInput.Value

        if not message or message == "" or message:match("^%s*$") then
            Library:Notify({
                Title = "Feedback System",
                Description = "Enter a message",
                Time = 4
            })
            return
        end

        lastFeedbackTime = currentTime 
        local gameInfo = getCurrentGame()

        -- avatar URL for author 
        local avatarUrl = "https://i.imgur.com/VkFSxpa.png" -- Custom icon here

        local embed = {
            ["title"] = "New Vulkan Feedback",
            ["description"] = "**Feedback Message:**\n> " .. message .. "\n\n",
            ["color"] = 0x6D28D9,

            ["author"] = {
                ["name"] = LocalPlayer.DisplayName .. " (" .. LocalPlayer.Name .. ")",
                ["url"] = "https://www.roblox.com/users/" .. tostring(LocalPlayer.UserId) .. "/profile",
                ["icon_url"] = avatarUrl
            },

            ["fields"] = {
                {
                    ["name"] = "",
                    ["value"] = string.format(
                        "**User ID:** `%s`",
                        tostring(LocalPlayer.UserId)
                    ),
                    ["inline"] = true
                },
                {
                    ["name"] = "",
                    ["value"] = string.format(
                        "**Place ID:** `%s`",
                        tostring(gameInfo.PlaceId)
                    ),
                    ["inline"] = true
                }
            },

            ["footer"] = {
                ["text"] = "Vulkan Feedback System"
            },

            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
        }

        local payload = HttpService:JSONEncode({embeds = {embed}})

        local success, err = pcall(function()
            local response = request({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = payload
            })

            if response.StatusCode ~= 200 and response.StatusCode ~= 204 then
                error("HTTP ".. tostring(response.StatusCode))
            end
        end)

        if success then
            Library:Notify({
                Title = "Feedback Sent",
                Description = "Thank you for the feedback",
                Time = 5
            })
            Options.FeedbackInput:SetValue("")
        else
            Library:Notify({
                Title = "Feedback Failed",
                Description = "Could not send feedback",
                Time = 5
            })
            warn("Feedback Error:", err)
        end
    end
})

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK CHANGELOGS
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local changelogs = {
    -- Additions
    {text = "Fixed VultureStack Notifications", sign = "-+-"},
    {text = "Created VultureStack Triggerbot", sign = "-+-"},
    {text = "Created Added Avatar Manager", sign = "-+-"},
    {text = "Created Avatar Manager Preview", sign = "-+-"},
    {text = "Created Avatar Manager Settings", sign = "-+-"},


    -- Removals
    {text = "Removed VultureStack Triggerbot", sign = "-+-"},
    {text = "Deleted VultureAssist",         sign = "-x-"},
    {text = "Deleted Vulkan",         sign = "-x-"},
}

local colors = {
    ["-+-"] = "rgb(36, 224, 108)",  -- Color of the added feature
    ["-x-"] = "rgb(221, 40, 40)",   -- Color of the removed feature
}

for _, changelog in ipairs(changelogs) do
    local sign = changelog.sign or "-+-"
    local color = colors[sign] or "rgb(255, 255, 255)"

    local formattedText = string.format(
        "<font color=\"%s\">[%s] %s</font>",
        color, sign, changelog.text
    )

    if sign == "-+-" then
        AdditionsTab:AddLabel({ Text = formattedText, DoesWrap = true })
    elseif sign == "-x-" then
        RemovalsTab:AddLabel({ Text = formattedText, DoesWrap = true })
    end
end

--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
   --Universal Walkspeed & jumppower
--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

WalkSpeedANDJumpPowerLeft = CharTab:AddLeftGroupbox("Walkspeed & Jumppower")

local Svc = {
    Run   = game:GetService("RunService"),
    LP    = game:GetService("Players").LocalPlayer,
}

local State = {
    DefWS = 16, DefJP = 50,
    WS    = 16,  JP   = 50,
    WSOn  = false, JPOn = false,
    Conn  = {}
}

local function dconn()
    for _, c in pairs(State.Conn) do
        if c and c.Disconnect then pcall(function() c:Disconnect() end) end
    end
    table.clear(State.Conn)
end

local function hum()
    local c = Svc.LP.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function hrp()
    local c = Svc.LP.Character
    if not c then return nil end
    return c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
end

local function fws()
    local h = hum()
    if h and State.WSOn then h.WalkSpeed = State.WS end
end

local function fjp()
    local h = hum()
    if h and State.JPOn then h.UseJumpPower = true h.JumpPower = State.JP end
end

local function fvs()
    if not State.WSOn then return end
    local r, h = hrp(), hum()
    if not r or not h then return end
    local md = h.MoveDirection
    if md.Magnitude > 0 then
        local cv = r.AssemblyLinearVelocity
        local dv = Vector3.new(md.X * State.WS, cv.Y, md.Z * State.WS)
        if (dv - cv).Magnitude > 1 then r.AssemblyLinearVelocity = dv end
    end
end

local function fbm()
    if not State.WSOn then return end
    local r = hrp()
    if not r then return end
    local bv = r:FindFirstChildOfClass("BodyVelocity")
    if bv then bv.MaxForce = Vector3.new(4000, 0, 4000) * (State.WS / 16) end
    local bp = r:FindFirstChildOfClass("BodyPosition")
    if bp then bp.MaxForce = Vector3.new(4000, 4000, 4000) * (State.WS / 16) end
end

local function fcb()
    if not State.WSOn then return end
    local r, h = hrp(), hum()
    if not r or not h then return end
    local md = h.MoveDirection
    if md.Magnitude > 0.1 then
        local b = (State.WS - 16) / 16
        if b > 0 then r.CFrame = r.CFrame + (md * b * 0.5) end
    end
end

local function startWS()
    dconn() State.WSOn = true
    table.insert(State.Conn, Svc.Run.Heartbeat:Connect(function()
        if State.WSOn then fws() fvs() fbm() end
    end))
    local h = hum()
    if h then
        table.insert(State.Conn, h:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if State.WSOn then fws() end
        end))
    end
    table.insert(State.Conn, Svc.Run.Stepped:Connect(function()
        if State.WSOn then fcb() end
    end))
end

local function stopWS()
    State.WSOn = false dconn()
    local h = hum()
    if h then h.WalkSpeed = State.DefWS end
end

local function startJP()
    State.JPOn = true
    table.insert(State.Conn, Svc.Run.Heartbeat:Connect(function()
        if State.JPOn then fjp() end
    end))
    local h = hum()
    if h then
        table.insert(State.Conn, h:GetPropertyChangedSignal("JumpPower"):Connect(function()
            if State.JPOn then fjp() end
        end))
    end
end

local function stopJP()
    State.JPOn = false
    local h = hum()
    if h then h.JumpPower = State.DefJP end
end

local function detectDef()
    local h = hum()
    if h then
        State.DefWS = h.WalkSpeed
        State.DefJP = h.UseJumpPower and h.JumpPower or 50
    end
end

task.spawn(function() task.wait(1) detectDef() end)

Svc.LP.CharacterAdded:Connect(function()
    dconn() task.wait(1) detectDef()
    if State.WSOn then startWS() end
    if State.JPOn then startJP() end
end)

WalkSpeedANDJumpPowerLeft:AddCheckbox("WalkSpeedToggle", { Text = "Custom WalkSpeed", Default = false })
WalkSpeedANDJumpPowerLeft:AddInput("WalkSpeedInput", { Text = "WalkSpeed Value", Placeholder = "Enter value...", Default = "16" })
WalkSpeedANDJumpPowerLeft:AddCheckbox("JumpPowerToggle", { Text = "Custom JumpPower", Default = false })
WalkSpeedANDJumpPowerLeft:AddInput("JumpPowerInput", { Text = "JumpPower Value", Placeholder = "Enter value...", Default = "50" })

Toggles.WalkSpeedToggle:OnChanged(function(s) if s then startWS() else stopWS() end end)

Options.WalkSpeedInput:OnChanged(function(v)
    local s = tonumber(v)
    if s and s >= 0 then State.WS = s if State.WSOn then fws() end end
end)

Toggles.JumpPowerToggle:OnChanged(function(s) if s then startJP() else stopJP() end end)

Options.JumpPowerInput:OnChanged(function(v)
    local p = tonumber(v)
    if p and p >= 0 then State.JP = p if State.JPOn then fjp() end end
end)

--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
   --Universal Spinbot
--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

CombatSpinRight  = CharTab:AddRightGroupbox("Spinbot")

local Svc = {
    Run = game:GetService("RunService"),
    LP  = game:GetService("Players").LocalPlayer,
}

local S = {
    gyro        = nil,
    connection  = nil,
    silentSpeed = 15,
    cframeSpeed = 50,
    activeMode  = nil,
    angle       = 0,
}

CombatSpinRight:AddToggle("SilentSpinbot",       { Text = "Silent Spinbot",   Default = false })
CombatSpinRight:AddToggle("CFrameSpinbot",        { Text = "CFrame Spinbot",   Default = false })
CombatSpinRight:AddSlider("SilentSpinSpeedSlider", { Text = "Silent Spin Speed", Default = 15, Min = 1, Max = 250, Rounding = 0 })
CombatSpinRight:AddSlider("CFrameSpinSpeedSlider", { Text = "CFrame Spin Speed", Default = 50,  Min = 1, Max = 150,  Rounding = 0 })

local function getParts()
    local c = Svc.LP.Character
    if not c then return nil, nil end
    return c:FindFirstChild("HumanoidRootPart"), c:FindFirstChildOfClass("Humanoid")
end

local function cleanup()
    if S.connection then S.connection:Disconnect() S.connection = nil end
    if S.gyro then S.gyro:Destroy() S.gyro = nil end
    local _, h = getParts()
    if h then h.AutoRotate = true end
    S.activeMode = nil
    S.angle = 0
end

local function startSilent()
    cleanup()
    local hrp, hum = getParts()
    if not hrp or not hum then return end
    S.activeMode = "Silent"
    hum.AutoRotate = false

    local att = Instance.new("Attachment")
    att.Name   = "SilentSpinAttachment"
    att.Parent = hrp

    local ao = Instance.new("AlignOrientation")
    ao.Name            = "SilentSpinGyro"
    ao.Mode            = Enum.OrientationAlignmentMode.OneAttachment
    ao.Attachment0     = att
    ao.MaxTorque       = 1e6
    ao.Responsiveness  = 50
    ao.RigidityEnabled = false
    ao.Parent          = hrp

    S.gyro = ao

    S.connection = Svc.Run.RenderStepped:Connect(function(dt)
        if not hrp or not hrp.Parent then return end
        S.angle = (S.angle + S.silentSpeed * dt * 60) % 360
        ao.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(S.angle), 0)
    end)

    ao.Destroying:Connect(function()
        if att and att.Parent then att:Destroy() end
    end)
end

local function startCFrame()
    cleanup()
    local hrp, hum = getParts()
    if not hrp or not hum then return end
    S.activeMode = "CFrame"
    hum.AutoRotate = false

    S.connection = Svc.Run.RenderStepped:Connect(function(dt)
        if not hrp or not hrp.Parent then return end
        S.angle = (S.angle + S.cframeSpeed * dt * 60) % 360
        hrp.CFrame = CFrame.new(hrp.Position)
            * CFrame.Angles(0, math.rad(S.angle), 0)
            * CFrame.new(0, 0, -(hrp.CFrame.Position - hrp.CFrame.Position).Magnitude)
    end)
end

local function activateMode(mode)
    if mode == "Silent" then
        if Toggles.CFrameSpinbot.Value then Toggles.CFrameSpinbot:SetValue(false) end
        startSilent()
    elseif mode == "CFrame" then
        if Toggles.SilentSpinbot.Value then Toggles.SilentSpinbot:SetValue(false) end
        startCFrame()
    end
end

Toggles.SilentSpinbot:OnChanged(function(v)
    if v then activateMode("Silent") elseif S.activeMode == "Silent" then cleanup() end
end)

Toggles.CFrameSpinbot:OnChanged(function(v)
    if v then activateMode("CFrame") elseif S.activeMode == "CFrame" then cleanup() end
end)

Options.SilentSpinSpeedSlider:OnChanged(function(v) S.silentSpeed = v end)
Options.CFrameSpinSpeedSlider:OnChanged(function(v) S.cframeSpeed = v end)

Svc.LP.CharacterAdded:Connect(function()
    local mode = S.activeMode
    cleanup()
    task.wait(1)
    local c = Svc.LP.Character
    if not c or not c:FindFirstChild("HumanoidRootPart") then return end
    if mode == "Silent" then startSilent()
    elseif mode == "CFrame" then startCFrame() end
end)

--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
   --Universal Soft-Aim MAIN
--[════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

CombatAB = CombatTab:AddLeftGroupbox("VultureStack Soft-Aim")
CombatABSettings = CombatTab:AddRightGroupbox("VultureStack Soft-Aim Settings")

local Svc = {
    Players = game:GetService("Players"),
    Input = game:GetService("UserInputService"),
    Run = game:GetService("RunService"),
}

local Camera = workspace.CurrentCamera

local S = {
    Target = nil,
    Locked = false,
    KeyHeld = false,
    Offset = Vector3.new(0, 0, 0),
    Conn = nil,
    WasLockedLastFrame = false,
}

local FOV = {
    Circle = Drawing.new("Circle"),
    Square = Drawing.new("Square"),
}

FOV.Circle.Thickness = 2
FOV.Circle.NumSides = 64
FOV.Circle.Radius = 200
FOV.Circle.Color = Color3.fromRGB(255, 255, 255)
FOV.Circle.Transparency = 1
FOV.Circle.Visible = false
FOV.Circle.Filled = false

FOV.Square.Thickness = 2
FOV.Square.Size = Vector2.new(400, 400)
FOV.Square.Color = Color3.fromRGB(255, 255, 255)
FOV.Square.Transparency = 1
FOV.Square.Visible = false
FOV.Square.Filled = false

CombatAB:AddToggle("LockOnToggle", { Text = "Enable Soft-Aim", Default = false })
CombatAB:AddToggle("ShowFOVToggle", { Text = "Show FOV Circle", Default = false })
CombatAB:AddToggle("AutoLockToggle", { Text = "Auto lock while in FOV radius", Default = false })
CombatAB:AddToggle("LockDetectionToggle", { Text = "Lock Detection", Default = false })
CombatAB:AddToggle("WallCheckToggle", { Text = "Wall Check", Default = false })
CombatAB:AddToggle("AdvancedWallCheckToggle", { Text = "Advanced Wall Check", Default = false })
CombatAB:AddToggle("IgnoreTeammatesToggle", { Text = "Team Check", Default = false })
CombatAB:AddToggle("DeathCheckToggle", { Text = "Death Check", Default = false })

CombatAB:AddDropdown("BodyPartDropdown", {
    Text = "Targeted Body Part",
    Values = { "Head", "Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart" },
    Default = 3,
})

CombatAB:AddDropdown("KeybindModeDropdown", {
    Text = "Soft-Aim Hotkey Mode",
    Values = { "Toggle", "Hold" },
    Default = 1,
})

CombatAB:AddDropdown("FOVModeDropdown", {
    Text = "FOV Circle Position",
    Values = { "Center", "Mouse" },
    Default = 2,
})

CombatAB:AddDropdown("LockMethodDropdown", {
    Text = "Tracking Method",
    Values = { "Camera", "Cursor" },
    Default = 1,
})

CombatAB:AddSlider("Smoothness", { Text = "Smoothness", Default = 20, Min = 1, Max = 50, Rounding = 1, Suffix = "" })
CombatAB:AddSlider("SmoothnessSpeed", { Text = "Smoothness Speed", Default = 1.75, Min = 0.1, Max = 5, Rounding = 2, Suffix = "" })
CombatAB:AddSlider("MaxDistance", { Text = "Max Distance", Default = 100, Min = 0, Max = 800, Rounding = 0, Suffix = "" })

CombatAB:AddLabel("Soft-Aim Hotkey"):AddKeyPicker("LockOnKey", {
    Text = "Soft-Aim Hotkey",
    Default = "F3",
    Mode = "Toggle",
})

CombatABSettings:AddLabel("FOV Circle Color"):AddColorPicker("FOVColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "FOV Circle Color",
    Transparency = 0,
})

CombatABSettings:AddLabel("Lock Detection Color"):AddColorPicker("LockDetectionColor", {
    Default = Color3.fromRGB(168, 0, 0),
    Title = "Lock Detection Color",
    Transparency = 0,
})

CombatABSettings:AddSlider("FOVTransparency", {
    Text = "FOV Circle Transparency",
    Default = 0.45,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Suffix = "",
})

CombatABSettings:AddSlider("FOV", { Text = "FOV Radius/Range", Default = 200, Min = 10, Max = 800, Rounding = 0, Suffix = "" })

CombatABSettings:AddDropdown("FOVShape", {
    Text = "FOV Shape",
    Values = { "Circle", "Square" },
    Default = 1,
})

Options.FOVShape:OnChanged(function() end)

-- Toggle handlers --
Toggles.LockOnToggle:OnChanged(function(state)
    if not state then
        S.Locked = false
        S.Target = nil
        if S.Conn then
            S.Conn:Disconnect()
            S.Conn = nil
        end
    end
end)

Toggles.ShowFOVToggle:OnChanged(function(state)
    FOV.Circle.Visible = state
end)

Toggles.AutoLockToggle:OnChanged(function(state)
    if not state then
        S.Locked = false
        S.Target = nil
    end
end)

-- Helper functions --
local function GetFOVCenter()
    if Options.FOVModeDropdown.Value == "Mouse" then
        return Svc.Input:GetMouseLocation()
    else
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    end
end

local function GetBodyPart(character, partName)
    if not character then return nil end
    local part = character:FindFirstChild(partName)
    if not part and partName == "Torso" then
        part = character:FindFirstChild("UpperTorso")
    elseif not part and partName == "UpperTorso" then
        part = character:FindFirstChild("Torso")
    end
    return part
end

local function GetTargetPart(character)
    return GetBodyPart(character, Options.BodyPartDropdown.Value)
end

local function IsTeammate(player)
    if not Toggles.IgnoreTeammatesToggle.Value then return false end
    local lp = Svc.Players.LocalPlayer
    if lp.Team and player.Team and lp.Team == player.Team then return true end
    if lp.TeamColor and player.TeamColor and lp.TeamColor == player.TeamColor then return true end
    return false
end

local function IsWithinDistance(targetCharacter)
    if Options.MaxDistance.Value <= 1 then return true end
    local lp = Svc.Players.LocalPlayer
    if not lp.Character then return false end
    local localRoot = lp.Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then return false end
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
    if not targetRoot then return false end
    return (localRoot.Position - targetRoot.Position).Magnitude <= Options.MaxDistance.Value
end

local function IsTargetValid(target)
    if not target or not target.Parent then return false end
    if not target.Character then return false end
    if IsTeammate(target) then return false end
    local humanoid = target.Character:FindFirstChild("Humanoid")
    if not humanoid then return false end
    if not IsWithinDistance(target.Character) then return false end
    if Toggles.DeathCheckToggle.Value then
        if humanoid.Health <= 0 or humanoid:GetState() == Enum.HumanoidStateType.Dead then return false end
    end
    return true
end

local function IsPartTransparent(part)
    if part:IsA("BasePart") then
        if part.Transparency >= 0.95 then return true end
    end
    if part:IsA("MeshPart") then
        if part.Transparency >= 0.95 then return true end
    end
    for _, child in pairs(part:GetChildren()) do
        if child:IsA("Decal") then
            if child.Transparency >= 0.95 then return true end
        end
    end
    for _, child in pairs(part:GetDescendants()) do
        if child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
            if child.Enabled == false then return true end
        end
    end
    return false
end

local function CanPartCollide(part)
    if part:IsA("BasePart") then
        if not part.CanCollide then return false end
    end
    return true
end

local function IsPartValidObstacle(part)
    if IsPartTransparent(part) then return false end
    if not CanPartCollide(part) then return false end
    return true
end

local function IsTargetVisible(targetCharacter)
    if not Toggles.WallCheckToggle.Value then return true end
    local lp = Svc.Players.LocalPlayer
    if not lp.Character then return false end
    local localRoot = lp.Character:FindFirstChild("HumanoidRootPart")
    if not localRoot then return false end
    local targetPart = GetTargetPart(targetCharacter)
    if not targetPart then return false end

    local rayOrigin = localRoot.Position
    local rayDirection = targetPart.Position - rayOrigin

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {lp.Character, targetCharacter}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.IgnoreWater = true

    local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)

    if raycastResult == nil then return true end

    if Toggles.AdvancedWallCheckToggle.Value then
        local hitPart = raycastResult.Instance
        if not IsPartValidObstacle(hitPart) then
            local ignoredParts = {lp.Character, targetCharacter}
            for _ = 1, 10 do
                local testParams = RaycastParams.new()
                testParams.FilterDescendantsInstances = ignoredParts
                testParams.FilterType = Enum.RaycastFilterType.Exclude
                testParams.IgnoreWater = true
                local testResult = workspace:Raycast(rayOrigin, rayDirection, testParams)
                if testResult == nil then return true end
                local testPart = testResult.Instance
                if IsPartValidObstacle(testPart) then return false end
                table.insert(ignoredParts, testPart)
            end
            return false
        else
            return false
        end
    end

    return false
end

local function GetNearestPlayer()
    local lp = Svc.Players.LocalPlayer
    if not lp.Character then return nil end
    if not lp.Character:FindFirstChild("HumanoidRootPart") then return nil end

    local fovCenter = GetFOVCenter()
    local fovRadius = Options.FOV.Value
    local nearestPlayer = nil
    local nearestDistance = math.huge

    for _, player in pairs(Svc.Players:GetPlayers()) do
        if player == lp then continue end
        if not player.Character then continue end
        if IsTeammate(player) then continue end
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if not humanoid or humanoid.Health <= 0 then continue end
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then continue end
        if not IsWithinDistance(player.Character) then continue end
        local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
        if not onScreen then continue end
        local dist = (Vector2.new(screenPos.X, screenPos.Y) - fovCenter).Magnitude
        if dist <= fovRadius and dist < nearestDistance and IsTargetVisible(player.Character) then
            nearestDistance = dist
            nearestPlayer = player
        end
    end

    return nearestPlayer
end

local function LockCamera()
    if not Options.LockMethodDropdown.Value then return end
    if not S.Target or not S.Target.Character then return end
    local tp = GetTargetPart(S.Target.Character)
    if not tp then return end
    local pos = tp.Position + S.Offset
    local sf  = math.clamp((1 / Options.Smoothness.Value) * Options.SmoothnessSpeed.Value, 0.001, 1)
    if Options.LockMethodDropdown.Value == "Camera" then
        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, pos), sf)
    elseif Options.LockMethodDropdown.Value == "Cursor" then
        local screenPos, onScreen = Camera:WorldToViewportPoint(pos)
        if not onScreen then return end
        local cur = Svc.Input:GetMouseLocation()
        local d   = cur:Lerp(Vector2.new(screenPos.X, screenPos.Y), sf) - cur
        if d.Magnitude < 0.1 then return end
        mousemoverel(d.X, d.Y)
    end
end

-- Key handlers --
Options.LockOnKey:OnClick(function()
    if not Toggles.LockOnToggle.Value then
        Library:Notify({ Title = "VultureStack Interface Notification", Description = "Soft-Aim is Disabled", Time = 3 })
        return
    end

    if Options.KeybindModeDropdown.Value == "Hold" then
        S.KeyHeld = true
        local nearestPlayer = GetNearestPlayer()
        if nearestPlayer then
            S.Target = nearestPlayer
            S.Locked = true
        else
            S.Locked = false
            Library:Notify({ Title = "VultureStack Interface Notification", Description = "No target found in FOV range", Time = 3 })
        end
    else
        S.Locked = not S.Locked
        if S.Locked then
            local nearestPlayer = GetNearestPlayer()
            if nearestPlayer then
                S.Target = nearestPlayer
            else
                S.Locked = false
                Library:Notify({ Title = "VultureStack Interface Notification", Description = "No target found in FOV range", Time = 3 })
            end
        else
            S.Target = nil
            Library:Notify({ Title = "VultureStack Interface Notification", Description = "Soft-Aim Deactivated", Time = 3 })
        end
    end
end)

Svc.Input.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if Options.KeybindModeDropdown.Value == "Hold" and S.KeyHeld then
        local boundKey = Options.LockOnKey.Value
        if input.KeyCode.Name == boundKey or input.UserInputType.Name == boundKey then
            S.KeyHeld = false
            S.Locked = false
            S.Target = nil
            Library:Notify({ Title = "VultureStack Interface Notification", Description = "Soft-Aim Deactivated", Time = 3 })
        end
    end
end)

-- Main render loop --
Svc.Run.RenderStepped:Connect(function()
    local fovCenter = GetFOVCenter()
    local isSquare = Options.FOVShape.Value == "Square"
    local showFOV = Toggles.ShowFOVToggle.Value
    local activeColor = Options.FOVColor.Value

    if Toggles.LockDetectionToggle.Value then
        if S.Locked and S.Target and IsTargetValid(S.Target) then
            activeColor = Options.LockDetectionColor.Value
        end
    end

    if isSquare then
        local size = Options.FOV.Value * 2
        FOV.Square.Size = Vector2.new(size, size)
        FOV.Square.Position = fovCenter - Vector2.new(size / 2, size / 2)
        FOV.Square.Transparency = Options.FOVTransparency.Value
        FOV.Square.Color = activeColor
        FOV.Square.Visible = showFOV
        FOV.Circle.Visible = false
    else
        FOV.Circle.Position = fovCenter
        FOV.Circle.Radius = Options.FOV.Value
        FOV.Circle.Transparency = Options.FOVTransparency.Value
        FOV.Circle.Color = activeColor
        FOV.Circle.Visible = showFOV
        FOV.Square.Visible = false
    end

    if not Toggles.LockOnToggle.Value then return end

    if Toggles.AutoLockToggle.Value then
        local nearestPlayer = GetNearestPlayer()
        if nearestPlayer then
            if S.Target ~= nearestPlayer then
                S.Target = nearestPlayer
            end
            S.Locked = true
        else
            S.Locked = false
            S.Target = nil
        end
    end

    if not S.Locked or not S.Target then return end

    if not IsTargetValid(S.Target) then
        if Toggles.AutoLockToggle.Value then
            local nearestPlayer = GetNearestPlayer()
            if nearestPlayer and IsTargetValid(nearestPlayer) then
                S.Target = nearestPlayer
            else
                S.Target = nil
                S.Locked = false
                return
            end
        else
            S.Target = nil
            S.Locked = false
            return
        end
    end

    if not IsTargetVisible(S.Target.Character) then
        if not Toggles.AutoLockToggle.Value then
            return
        else
            local nearestPlayer = GetNearestPlayer()
            if nearestPlayer and IsTargetValid(nearestPlayer) then
                S.Target = nearestPlayer
            else
                S.Target = nil
                S.Locked = false
                return
            end
        end
    end

    LockCamera()
    S.WasLockedLastFrame = S.Locked
end)

Svc.Players.LocalPlayer.CharacterAdded:Connect(function()
    S.Locked = false
    S.Target = nil
end)

Svc.Players.PlayerRemoving:Connect(function(player)
    if player == S.Target then
        S.Target = nil
        S.Locked = false
    end
end)

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK TRIGGERBOT
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local TriggerBot = CombatTab:AddRightGroupbox("VultureStack Triggerbot")

local TriggerBotToggle1 = TriggerBot:AddToggle("TriggerbotToggle1", {
    Text    = "Toggle Triggerbot",
    Default = false,
})

local TriggerBotToggle2 = TriggerBot:AddToggle("TriggerbotToggle2", {
    Text    = "Team Check",
    Default = false,
})

TriggerBot:AddDropdown("ModeSelection", {
    Text       = "Triggerbot Mode",
    Values     = { "Default", "Hold", "Rapid" },
    Multi      = false,
    Searchable = true,
    Default    = { "Default" },
})

TriggerBot:AddSlider("TriggerBotDelay", {
    Text     = "Triggerbot Delay",
    Default  = 10,
    Min      = 0,
    Max      = 200,
    Rounding = 1,
    Suffix   = "ms",
})

TriggerBot:AddDropdown("BodyPartSelection", {
    Text       = "Targeted Body Parts",
    Values     = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
    Multi      = true,
    Searchable = true,
    Default    = { "Head" },
})

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK SKIN CHANGER
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local Svc = {
    Http        = game:GetService("HttpService"),
    Players     = game:GetService("Players"),
    Marketplace = game:GetService("MarketplaceService"),
    Run         = game:GetService("RunService"),
    Stats       = game:GetService("Stats"),
}

local State = {
    originalDesc = nil,
    currentDesc  = nil,
    applying     = false,
}

local Prev = {
    model   = nil,
    cam     = nil,
    world   = nil,
    rot     = 180,
    token   = 0,
    rotConn = nil,
}

local LocalPlayer = Svc.Players.LocalPlayer

local AvatarCopierGroup2 = CharTab:AddLeftGroupbox("VultureStack Avatar Manager Settings")

local AvatarCopierGroup  = CharTab:AddLeftGroupbox("VultureStack Avatar Manager")

local AvatarCopierGroup1 = CharTab:AddRightGroupbox("VultureStack Avatar Manager Preview")

local PreviewViewport = AvatarCopierGroup1:AddViewport("AvatarPreview", {
    Object      = Instance.new("Part"),
    Camera      = Instance.new("Camera"),
    Interactive = false,
    AutoFocus   = false,
    Height      = 362,
})

local toolHolder = Instance.new("Folder")
toolHolder.Name   = "_VSToolHolder"
toolHolder.Parent = LocalPlayer

local function saveTools()
    local saved   = {}
    local char    = LocalPlayer.Character
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")

    if backpack then
        for _, v in ipairs(backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = toolHolder
                table.insert(saved, v)
            end
        end
    end

    if char then
        for _, v in ipairs(char:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = toolHolder
                table.insert(saved, v)
            end
        end
    end

    return saved
end

local function restoreTools(saved)
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then return end

    task.spawn(function()
        for _, tool in ipairs(saved) do
            if tool and tool.Parent == toolHolder then
                tool.Parent = backpack
                task.wait()
            end
        end
    end)
end

local function applyDesc(desc)
    local char = LocalPlayer.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end

    if not State.originalDesc then
        State.originalDesc = hum:GetAppliedDescription()
    end

    local saved = saveTools()

    local itemsToDestroy = {}
    for _, v in ipairs(char:GetChildren()) do
        if  v:IsA("Accessory")    or v:IsA("Hat")         or
            v:IsA("Shirt")        or v:IsA("Pants")        or
            v:IsA("ShirtGraphic") or v:IsA("BodyColors")   or
            v:IsA("CharacterMesh") or v:IsA("Clothing") then
            table.insert(itemsToDestroy, v)
        end
    end
    for _, v in ipairs(itemsToDestroy) do v:Destroy() end

    local ok = pcall(function()
        if hum.ApplyDescriptionClientServer then
            hum:ApplyDescriptionClientServer(desc)
        else
            hum:ApplyDescription(desc)
        end
    end)

    local bc = char:FindFirstChildOfClass("BodyColors")
    if not bc then
        bc = Instance.new("BodyColors")
        bc.Parent = char
    end

    bc.HeadColor3      = desc.HeadColor
    bc.TorsoColor3     = desc.TorsoColor
    bc.LeftArmColor3   = desc.LeftArmColor
    bc.RightArmColor3  = desc.RightArmColor
    bc.LeftLegColor3   = desc.LeftLegColor
    bc.RightLegColor3  = desc.RightLegColor

    task.delay(0.3, function() restoreTools(saved) end)

    return ok
end

local function onCharacterAdded(char)
    if not State.currentDesc then return end
    char:WaitForChild("Humanoid", 10)
    task.wait(0.5)
    applyDesc(State.currentDesc)
end

LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end

local function loadPreview(userId)
    Prev.token = Prev.token + 1
    local thisToken = Prev.token

    if Prev.rotConn then Prev.rotConn:Disconnect(); Prev.rotConn = nil end
    if Prev.model   then Prev.model:Destroy();      Prev.model   = nil end
    if Prev.cam     then Prev.cam:Destroy();         Prev.cam     = nil end
    if Prev.world   then Prev.world:Destroy();       Prev.world   = nil end

    task.spawn(function()
        local ok, model = pcall(Svc.Players.CreateHumanoidModelFromUserId, Svc.Players, userId)
        if Prev.token ~= thisToken then
            if ok and model then model:Destroy() end
            return
        end
        if not ok or not model then
            Library:Notify({ Title = "VultureStack Message!", Description = "Failed to load preview", Time = 3 })
            return
        end

        Prev.world        = Instance.new("WorldModel")
        Prev.model        = model
        Prev.model.Parent = Prev.world

        local hum = Prev.model:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end

        local root = Prev.model:FindFirstChild("HumanoidRootPart")
        if root then
            root.Anchored = true
            root.CFrame   = CFrame.new(0, 0, 0)
        end

        Prev.cam  = Instance.new("Camera")
        Prev.rot  = 180
        local zoom       = 7.5
        local lookTarget = Vector3.new(0, -0.5, 0)

        local a = math.rad(Prev.rot)
        Prev.cam.CFrame = CFrame.new(
            root.Position + Vector3.new(math.sin(a) * zoom, -1.5, math.cos(a) * zoom),
            root.Position + lookTarget
        )

        PreviewViewport:SetObject(Prev.world)
        PreviewViewport:SetCamera(Prev.cam)

        Prev.rotConn = Svc.Run.Heartbeat:Connect(function(dt)
            if Prev.cam and Prev.model and Prev.model.Parent then
                Prev.rot = Prev.rot + 25 * dt
                local a2 = math.rad(Prev.rot)
                Prev.cam.CFrame = CFrame.new(
                    root.Position + Vector3.new(math.sin(a2) * zoom, -1.5, math.cos(a2) * zoom),
                    root.Position + lookTarget
                )
            end
        end)
    end)
end

local function resetToSelf()
    loadPreview(LocalPlayer.UserId)
end

resetToSelf()

local function resolveUser(text)
    if tonumber(text) then
        local id = tonumber(text)
        local ok, name = pcall(Svc.Players.GetNameFromUserIdAsync, Svc.Players, id)
        return id, ok and name or tostring(id)
    else
        local ok, id = pcall(Svc.Players.GetUserIdFromNameAsync, Svc.Players, text)
        if not ok then return nil, nil end
        return id, text
    end
end

AvatarCopierGroup:AddInput("AvatarTarget", {
    Text             = "Client Sided Avatar Manager",
    Placeholder      = "Username or User ID...",
    Default          = "",
    Numeric          = false,
    Finished         = false,
    ClearTextOnFocus = false,
    Callback = function(text)
        text = text:match("^%s*(.-)%s*$")
        if text == "" then resetToSelf() return end

        Prev.token = Prev.token + 1
        local thisToken = Prev.token

        task.delay(0.6, function()
            if Prev.token ~= thisToken then return end
            task.spawn(function()
                local id = resolveUser(text)
                if not id then return end
                if Prev.token ~= thisToken then return end
                loadPreview(id)
            end)
        end)
    end,
})

local ChangeBtn = AvatarCopierGroup:AddButton({
    Text = "Change Avatar",
    Func = function()
        if State.applying then return end
        local text = Options.AvatarTarget.Value:match("^%s*(.-)%s*$")
        if text == "" then
            Library:Notify({ Title = "VultureStack Interface Notification", Description = "Enter a username or user ID first", Time = 5 })
            return
        end

        State.applying = true
        task.spawn(function()
            local id, name = resolveUser(text)
            if not id then
                Library:Notify({ Title = "VultureStack Interface Notification", Description = "User not found: " .. text, Time = 3 })
                State.applying = false
                return
            end

            Library:Notify({ Title = "VultureStack Interface Notification", Description = "Getting assets for " .. name .. "...", Time = 2 })

            local ok, desc = pcall(Svc.Players.GetHumanoidDescriptionFromUserId, Svc.Players, id)
            if not ok or not desc then
                Library:Notify({ Title = "VultureStack Interface Notification", Description = "Failed to get avatar", Time = 3 })
                State.applying = false
                return
            end

            State.currentDesc = desc
            local success = applyDesc(desc)

            if not Prev.model then loadPreview(id) end

            Library:Notify({
                Title       = "VultureStack Interface Notification",
                Description = success and ("Changed to " .. name) or "Failed to change avatar",
                Time        = 3
            })
            State.applying = false
        end)
    end
})

ChangeBtn:AddButton({
    Text = "Revert Avatar",
    Func = function()
        if State.applying then return end
        if not State.originalDesc then
            Library:Notify({ Title = "VultureStack Interface Notification", Description = "Original avatar isn't saved yet.", Time = 3 })
            return
        end

        State.applying = true
        task.spawn(function()
            State.currentDesc = nil
            local ok = applyDesc(State.originalDesc)
            State.originalDesc = nil
            resetToSelf()
            Library:Notify({
                Title       = "VultureStack Interface Notification",
                Description = ok and "Changed to original avatar" or "Failed to change avatar",
                Time        = 3
            })
            State.applying = false
        end)
    end
})



AvatarCopierGroup2:AddCheckbox("CopyAccessories", { Text = "Copy Avatar Accessories", Default = true })
Toggles.CopyAccessories:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("CopyShirts", { Text = "Copy Avatar Shirts", Default = true })
Toggles.CopyShirts:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("Anim", { Text = "Copy Avatar Animations", Default = true })
Toggles.Anim:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("CopyTShirts", { Text = "Copy Avatar T-Shirts", Default = true })
Toggles.CopyTShirts:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("Body", { Text = "Copy Avatar Body R6/R15", Default = true })
Toggles.Body:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("CopyPants", { Text = "Copy Avatar Pants", Default = true })
Toggles.CopyPants:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("Skin", { Text = "Copy Avatar Body Color", Default = true })
Toggles.Skin:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("Hair", { Text = "Copy Avatar Hair", Default = true })
Toggles.Hair:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)



AvatarCopierGroup2:AddCheckbox("CopyFaceHead", { Text = "Copy Avatar Face/Head", Default = true })
Toggles.CopyFaceHead:OnChanged(function(state) print("Toggle state changed to " .. tostring(state)) end)


--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK WATERMARK & KEYBINDS
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local DraggableLabel = Library:AddDraggableLabel("VultureStack")
local WatermarkEnabled = true
DraggableLabel:SetVisible(true)

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

RunService.RenderStepped:Connect(function()
    if not WatermarkEnabled then return end
    FrameCounter += 1
    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter
        FrameTimer = tick()
        FrameCounter = 0
    end
    DraggableLabel:SetText(
        ("VultureStack | %s fps | %s ms"):format(
            math.floor(FPS),
            math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        )
    )
end)

MenuTab:AddLabel("Interface Keybind"):AddKeyPicker("MenuToggleKeybind", {
    Default = "F1", NoUI = true, Text = "Toggle Interface"
})
task.defer(function()
    Options.MenuToggleKeybind:OnClick(function() Library:Toggle() end)
end)

WatermarkTab:AddLabel("Watermark Keybind"):AddKeyPicker("WatermarkToggleKeybind", {
    Default = "F2", NoUI = true, Text = "Toggle Watermark"
})
task.defer(function()
    Options.WatermarkToggleKeybind:OnClick(function()
        WatermarkEnabled = not WatermarkEnabled
        DraggableLabel:SetVisible(WatermarkEnabled)
    end)
end)

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK GUI/THEMES
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

ThemeManager:SetDefaultTheme({
    BackgroundColor = Color3.fromRGB(7, 7, 7),
MainColor = Color3.fromRGB(7, 7, 7),
    AccentColor = Color3.fromRGB(145, 23, 55),
OutlineColor = Color3.fromRGB(14, 14, 14),
    FontColor = Color3.fromRGB(235, 235, 235),
FontFace = Enum.Font.Jura,
})

Library:SetFont(Enum.Font.Jura)

Library:SetDPIScale(99)

SaveManager:SetFolder("VultureStack Configs")

SaveManager:SetIgnoreIndexes({ "MenuKeybind", "WatermarkToggleKeybind" })

SaveManager:BuildConfigSection(Tabs["UI Settings"])

ThemeManager:ApplyToTab(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK NOTIFICATION SETTINGS
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

-- Notification Sound Selection (MUST be before keybinds)
local NotificationSounds = {
    ["Default"] = 4590662766,
    ["Ipad"]   = 73722479618078,
    ["Swoosh"]  = 278063150,
    ["Futuristic"]   = 6518811702,
}
local SelectedNotificationSound = NotificationSounds["Default"]

--PUT NOTIFICATIONS HERE

-- Get Skin Keybind
KeybindsTab:AddLeftGroupbox("Hotkey 1")
    :AddLabel("Selected Hotkey:")
    :AddKeyPicker("GetSkinKeybind", {
        Default = nil,
        NoUI = true,
        Text = "Hotkey"
    })
task.defer(function()
    Options.GetSkinKeybind:OnClick(function()
        Library:Notify({
            Title = "VultureStack Interface Notification",
            Description = "Example Notification.",
            SoundId = SelectedNotificationSound,
            Time = 5
        })
    end)
end)

-- Revert Skin Keybind
KeybindsTab:AddRightGroupbox("Hotkey 2")
    :AddLabel("Selected Hotkey:")
    :AddKeyPicker("RevertSkinKeybind", {
        Default = nil,
        NoUI = true,
        Text = "Hotkey"
    })
task.defer(function()
    Options.RevertSkinKeybind:OnClick(function()
        Library:Notify({
            Title = "VultureStack Interface Notification",
            Description = "Example Notification.",
            SoundId = SelectedNotificationSound,
            Time = 5
        })
    end)
end)

--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--
--  VULTURESTACK GENERAL SETTINGS
--[═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════]--

-- General Interface Settings Groupbox
local UISettingsGroup = Tabs["UI Settings"]:AddRightGroupbox("General Interface Settings")

-- Notification Sounds Toggle
local NotificationSoundsEnabled = true
UISettingsGroup:AddToggle("DisableNotificationSounds", {
    Text = "Notification Sounds",
    Default = true,
})
Toggles.DisableNotificationSounds:OnChanged(function(state)
    NotificationSoundsEnabled = state
end)

-- Notification Toggle
local NotificationsEnabled = true
UISettingsGroup:AddToggle("DisableNotifications", {
    Text = "Hide Notifications",
    Default = false,
})
Toggles.DisableNotifications:OnChanged(function(state)
    NotificationsEnabled = not state
end)

-- Notification overlay
local OriginalNotify = Library.Notify
Library.Notify = function(self, args, ...)
    if NotificationsEnabled then
        if type(args) == "table" and not NotificationSoundsEnabled and args.SoundId then
            args.SoundId = nil
        end
        return OriginalNotify(self, args, ...)
    end
end

-- Notification Sound Dropdown
UISettingsGroup:AddDropdown("NotificationSoundDropdown", {
    Text = "Custom Notification Sounds",
    Values = { "Default", "Ipad", "Swoosh", "Alert" },
    Searchable = true,
    Default = 1,
})
Options.NotificationSoundDropdown:OnChanged(function()
    SelectedNotificationSound = NotificationSounds[Options.NotificationSoundDropdown.Value]
end)

local env = getgenv and getgenv() or _G
local hwidFuncs = {"gethwid","getexecutorhwid","get_hwid","GetHWID","getHWID","get_hardware_id","GetHardwareID","getdeviceid","GetDeviceID","getguid","getexecutorguid", "randomhwid", " ishwidspoofed", " sethwid", "resethwid"}
math.randomseed(os.time())
local function generateHex(length)
    local hex = ""
    for i = 1, length do
        hex = hex .. string.format("%x", math.random(0, 15))
    end
    return hex:upper()
end

local spoofedHWID = ("[+] " .. generateHex(64) .. " [+]"):upper()

local realHWID
for _, name in ipairs(hwidFuncs) do
    local func = env[name]
    if func and type(func) == "function" then
        local success, result = pcall(func)
        if success and type(result) == "string" and #result > 0 then
            realHWID = result
            break
        end
    end
end

for _, name in ipairs(hwidFuncs) do
    local original = env[name]
    if original and type(original) == "function" and hookfunction then
        pcall(hookfunction, original, function() return spoofedHWID end)
    end
    env[name] = function() return spoofedHWID end
end

if hookmetamethod then
    local oldIndex = hookmetamethod(_G, "__newindex", function(self, key, value)
        for _, name in ipairs(hwidFuncs) do
            if key == name and type(value) == "function" then
                rawset(self, key, function() return spoofedHWID end)
                return
            end
        end
        return oldIndex(self, key, value)
    end)
end

getgenv().HWIDSpoofer = {
    spoofed = spoofedHWID,
    real = realHWID,
    respoof = function(new) spoofedHWID = new or spoofedHWID end
}

else
    game:GetService("Players").LocalPlayer:Kick("Invalid Whitelist")
end

--[[

-- Key system module
local function validateKey(whitelist)
    -- Get user input (you'll need to implement this part)
    local userInput = "1821" -- Replace with actual input method
    
    if userInput == whitelist then
        return true
    else
        return false
    end
end

-- Main execution
if validateKey(whitelist) then  -- Use the passed whitelist
    -- Your main script code here
    print("Access granted!")
    -- Rest of your obfuscated code
else
    game:GetService("Players").LocalPlayer:Kick("Invalid key")
end

]]--

--[[

Ox4 = "x9f3Kq72LmZ8pQ4vT1aW0rE6YhC5uJbNsD8gH2F7kPqXzR3mV9tLQ7nP2zV8cX4aB6dE9fG1hJ3kL5mN8pQwR7tY2uI5oP8sD"
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/stxdevs/0x56756C74757265/refs/heads/0x1/0x416E6172636879.lua"))(Ox4)

]]--
