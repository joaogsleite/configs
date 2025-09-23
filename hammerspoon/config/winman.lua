local helpers = require('helpers')

local profileWindowTitles = {
  Personal = {"Personal", "P:"},
  Merkle = {"Merkle", "M:"},
  Arrow = {"Arrow", "A:", "ARWDT", "Backlog"},
}
local function getWindowsFromApp(appName)
  local app = hs.application.get(appName)
  if app then
    return app:allWindows()
  else
    return {}
  end
end
local function getSafariProfileWindow(profileName)
  local appWindows = getWindowsFromApp("Safari")
  local windowTitles = profileWindowTitles[profileName]
  for _, win in ipairs(appWindows) do
    if helpers.startsWithAny(win:title(), windowTitles) then
      return win
    end
  end
end
local function focusWindow(win)
  win:unminimize()
  win:focus()
end

_G.focusSafariProfile = function(profileName)
  local win = getSafariProfileWindow(profileName)
  print(win)
  if win then
    focusWindow(win)
  else
    hs.application.launchOrFocus("Safari")
  end
end

_G.openUrlInSafariProfile = function(profileName, url)
  local win = getSafariProfileWindow(profileName)
  if win then
    if url and url ~= "" then
      hs.pasteboard.setContents(url)
    end
    focusWindow(win)
    hs.eventtap.keyStroke({"cmd"}, "t")
    hs.eventtap.keyStroke({"cmd"}, "l")
    hs.eventtap.keyStroke({"cmd"}, "v")
    hs.eventtap.keyStroke({}, "return")
  end
end

_G.focusSafariTab = function(tabUrl)
  local _, winIndex = hs.osascript.applescript([[
    tell application "Safari"
      repeat with w in windows
        repeat with t in tabs of w
          if (URL of t contains "]]..tabUrl..[[") then
            set current tab of w to t
            return index of w
          end if
        end repeat
      end repeat
    end tell
  ]])
  local win = getWindowsFromApp("Safari")[winIndex]
  focusWindow(win)
end

_G.focusMeeting = function()  
  local focused = _G.focusTeams(true)
  if not focused then
    focused = _G.focusDiscord(true)
  end
end

_G.focusDiscord = function(meeting)
  meeting = meeting or false
  local appWindows = getWindowsFromApp("Discord")
  for _, win in ipairs(appWindows) do
    if meeting ~= helpers.endsWith(win:title(), "- Discord") then
      focusWindow(win)
      return win
    end
  end
  return false
end


_G.focusTeams = function(meeting)
  meeting = meeting or false
  local teamsViews = {"Activity", "Chat", "Calendar", "Calls", "OneDrive", "Copilot", "Workday",  "Apps", "Meeting compact view"}
  local appWindows = getWindowsFromApp("Microsoft Teams")
  for _, win in ipairs(appWindows) do
    if meeting ~= helpers.startsWithAny(win:title(), teamsViews) then
      focusWindow(win)
      return win
    end
  end
  return false
end

_G.focusAppWindow = function(appName, windowTitle)
  local appWindows = getWindowsFromApp(appName)
  for _, win in ipairs(appWindows) do
    if string.find(win:title(), windowTitle) then
      focusWindow(win)
      break
    end
  end
end
