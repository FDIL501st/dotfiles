Name = "steam"
NamePretty = "Steam Games Menu"
Icon = "steam"
Terminal = false
Cache = true
-- for the most part, available steam games should not be changing much
-- only time it changes is when games removed or downloaded
-- restarting the service/computer restart are good times in case download a new game
-- or use clear applications cache command
Action = "%VALUE%"

Home = os.getenv("HOME")
SteamAppInfoLocation = Home .. "/.steam/steam/steamapps/"
SteamIconLocation = Home .. "/.local/share/icons/hicolor/32x32/apps/"
DefaultGameIcon = "steam"
-- It seems game icons only exist when ask steam to create a desktop shortcut (deleting the desktop shortcut still keeps the icon in the system)
-- location seems to be $HOME/.local/share/icons/hicolor/32x32/apps/ for all games? Hopefully

local function readlines(file)
    local f = io.open(file, "r")
    if f == nil then
        print("Unable to open file:" .. file)
        return nil
    end

    local app = {}
    for _ = 1, 5 do
        -- no need to read all lines, just first 5
        local line = f:read("*l") -- read line (skipping end of line char)
        for key, value in line:gmatch('"([^"]+)"%s+"([^"]+)"') do
            -- matches 2 parts inside " " in a line. Luckily steam puts "" arounds their info, so we use that to find our data
            app[key] = value
        end
    end
    f:close()
    return app
end

-- Checks if the appid needs to be ignored. Ignore means not adding to entries.
-- returns true to ignore, else false
local function ignoreAppid(appid)
    -- appid for steam linux runtimes
    local ignore_appid = { "1070560", "1391110", "228980", "4183110" }
    for _, id in ipairs(ignore_appid) do
        if appid == id then
            return true
        end
    end
    return false
end

-- Checks if the icon for a game exists. Game is specified using its appid
-- if icon file found, then return icon name for the app. Otherwise returns the default game icon.
local function iconToUse(appid)
    local appIcon = "steam_icon_" .. appid
    local iconFile = SteamIconLocation .. appIcon
    local command = "find "..iconFile.. "-maxdepth 1"
    local result = os.execute(command)
    if result == true then
        return appIcon
    end
    -- did not find file (command failed)
    return DefaultGameIcon
end

function GetEntries()
    local command = "find " .. SteamAppInfoLocation .. " -maxdepth 1".. " -name '*.acf'"
    local handle = io.popen(command)
    if handle == nil then
        print("Did not expect command: " .. command .. ", to return nil")
        return {}
    end


    local entries = {}

    for file in handle:lines() do
        local appInfo = readlines(file)
        if appInfo == nil then
            print("Expected function readlines to not return nill")
            return {}
        end
        local key1 = "appid"
        local key2 = "name"
        local appid = appInfo[key1]
        local name = appInfo[key2]

        -- Filter out steam runtimes as those aren't games
        if ignoreAppid(appid) then goto continue end

        local icon = iconToUse(appid)
        table.insert(entries, { Text = name, Value = "steam steam://run/" .. appid, Icon = icon })

        ::continue::
    end

    handle:close()

    return entries
end
