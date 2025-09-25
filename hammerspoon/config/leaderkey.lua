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

_G.focusApp = function (appName)
  local app = hs.application.get(appName)
  if app then
    app:activate()
  end
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

_G.moveWindowToNextScreen = function()
  index = index or 0
  local win = hs.window.focusedWindow()
  if not win then return end
  local nextScreen = win:screen():next()
  if nextScreen then
    win:moveToScreen(nextScreen, true, true, 0)
    win:maximize()
  end
end

_G.moveWindow = function (layout)
  local win = hs.window.focusedWindow()
  if win then
    win:moveToUnit(hs.layout[layout])
  end
end

local function isMaximized(win)
  local f = win:frame()
  local s = win:screen():frame()
  local tolerance = 10
  return math.abs(f.x - s.x) <= tolerance
    and math.abs(f.y - s.y) <= tolerance
    and math.abs(f.w - s.w) <= tolerance
    and math.abs(f.h - s.h) <= tolerance
end

_G.focusWindowInDirection = function(direction)
  local win = hs.window.focusedWindow()
  if not win then return end
  local winFrame = win:frame()
  local winCenter = hs.geometry.point(winFrame.x + winFrame.w/2, winFrame.y + winFrame.h/2)
  local allWins = hs.window.orderedWindows()
  local target = nil
  local minDistance = math.huge
  for _, other in ipairs(allWins) do
    if other:id() ~= win:id() and not isMaximized(other) then
      local f = other:frame()
      local center = hs.geometry.point(f.x + f.w/2, f.y + f.h/2)
      local dx = center.x - winCenter.x
      local dy = center.y - winCenter.y
      local inDirection = false
      if direction == "left" and dx < 0 then inDirection = true end
      if direction == "right" and dx > 0 then inDirection = true end
      if direction == "up" and dy < 0 then inDirection = true end
      if direction == "down" and dy > 0 then inDirection = true end
      if inDirection then
        local distance = dx*dx + dy*dy
        if distance < minDistance then
          minDistance = distance
          target = other
        end
      end
    end
  end
  if target then
    target:focus()
  end
end
