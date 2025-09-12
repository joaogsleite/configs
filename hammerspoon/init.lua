
_G.wsRetry = 0
local function wsConnect()
  local wsRetry = _G.wsRetry
  local wsUrl = "ws://127.0.0.1:58174?name=hammerspoon"
  _G.wsSocket = hs.websocket.new(wsUrl, function(status, msg)
    if status == "open" then
      print("Connected to websocket.")
    elseif status == "closed" then
      print("Disconnected from websocket.")
      if (_G.wsRetry < wsRetry+1) then
        _G.wsRetry = wsRetry+1
        hs.timer.doAfter(3, wsConnect)
      end
    elseif status == "fail" then
      print("Failed to connect to websocket.")
      if (_G.wsRetry < wsRetry+1) then
        _G.wsRetry = wsRetry+1
        hs.timer.doAfter(3, wsConnect)
      end
    elseif status == "received" then
      wsMsgReceived(hs.json.decode(msg))
    end
  end)
end
wsConnect()

function wsMsgReceived(obj)
  print("Received from websocket:")
  print(hs.inspect(obj))
end

function wsSend(obj)
  print("Sending to websocket:")
  print(hs.inspect(obj))
  _G.wsSocket:send(hs.json.encode(obj))
end

function string_split(str, sep)
  local result = {}
  for part in string.gmatch(str, "[^" .. sep .. "]+") do
    table.insert(result, part)
  end
  return result
end

function openApp(app) 
  hs.application.launchOrFocus(app)
end

function frontmostApp()
  local frontApp = hs.application.frontmostApplication()
  return frontApp:name()
end

function goClickAndMoveBack(x, y) 
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local originalPos = hs.mouse.getAbsolutePosition()
  local targetPos = hs.geometry.point(f.x + 50, f.y + 137)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, targetPos):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, targetPos):post()
  hs.timer.usleep(10000)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, targetPos):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, targetPos):post()
  hs.mouse.setAbsolutePosition(originalPos)
end

function keyStroke(mods, key)
  local keyCode = hs.keycodes.map[key]
  hs.eventtap.event.newKeyEvent(mods, keyCode, true):post()  -- key down
  hs.eventtap.event.newKeyEvent(mods, keyCode, false):post() -- key up
end

local flagsDown = {}
local keyDownStates = {}
local shortcutBindings = {}

function onshortcut(shortcut, cb, app)
  local keys = string_split(shortcut, "+")
  local lastKey = table.remove(keys)
  local lastKeyCode = hs.keycodes.map[string.lower(lastKey)]
  table.insert(keys, lastKeyCode)
  local shortcutWithCode = table.concat(keys, "+")
  shortcutBindings[shortcutWithCode] = { cb = cb, app = app }
end

-- Single eventtap
if myKeyInterceptor then
    myKeyInterceptor:stop()
end
myKeyInterceptor = hs.eventtap.new(
  {hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp},
  function(event)
    local kc = event:getKeyCode()
    local et = event:getType()
    local flags = event:getFlags()
    if et == hs.eventtap.event.types.flagsChanged then
      flagsDown.shift = flags.shift
      flagsDown.ctrl = flags.ctrl
      flagsDown.alt = flags.alt
      if kc == 54 then
        flagsDown.rcmd = flags.cmd
      else
        flagsDown.cmd = flags.cmd
      end
      return false
    end
    if et == hs.eventtap.event.types.keyDown then
      local shortcut = ""
      if flagsDown.shift then
        shortcut = shortcut .. "shift+"
      end
      if flagsDown.ctrl then
        shortcut = shortcut .. "ctrl+"
      end
      if flagsDown.alt then
        shortcut = shortcut .. "alt+"
      end
      if flagsDown.rcmd then
        shortcut = shortcut .. "rcmd+"
      elseif flagsDown.cmd then
        shortcut = shortcut .. "cmd+"
      end
      shortcut = shortcut .. kc
      if shortcutBindings[shortcut] then
        if not keyDownStates[kc] then
          keyDownStates[kc] = true
          if shortcutBindings[shortcut].app and frontmostApp() ~= shortcutBindings[shortcut].app then
            return false
          end
          local result = shortcutBindings[shortcut].cb()
          if result == nil then
            return true
          else
            return result
          end
        end
      end
    end
    if et == hs.eventtap.event.types.keyUp then
      keyDownStates[kc] = false
    end
    return false
  end
)
myKeyInterceptor:start()
onshortcut("rcmd+k", function()
  openApp("MacPass")
end)
onshortcut("rcmd+o", function()
  openApp("OrbStack")
end)
onshortcut("rcmd+r", function()
  openApp("Reminders")
end)
onshortcut("rcmd+p", function()
  openApp("Preview")
end)
onshortcut("rcmd+l", function()
  openApp("Blender")
end)
onshortcut("rcmd+n", function()
  openApp("Notes")
end)
onshortcut("rcmd+b", function()
  openApp("Firefox")
end)
onshortcut("rcmd+f", function() 
  openApp("Finder")
end)
onshortcut("rcmd+v", function() 
  openApp("Visual Studio Code")
end)
onshortcut("rcmd+c", function() 
  openApp("Google Chrome")
end)
onshortcut("rcmd+z", function() 
  openApp("Terminal")
end)
onshortcut("rcmd+h", function() 
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "03.xyz" })
end)
onshortcut("rcmd+t", function() 
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "teams.microsoft.com" })
end)
onshortcut("rcmd+w", function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "web.whatsapp.com" })
end)
onshortcut("rcmd+d", function() 
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "discord.com" })
end)
onshortcut("rcmd+g", function() 
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "mail.google.com" })
end)
onshortcut("rcmd+i", function() 
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "chatgpt.com" })
end)
onshortcut("rcmd+j", function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "atlassian.net/jira" })
end)
onshortcut("cmd+/", function()
  keyStroke({"shift", "ctrl"}, "f16")
end, "Firefox")
onshortcut("alt+cmd+u", function()
  keyStroke({"shift", "ctrl"}, "f17")
end, "Firefox")
onshortcut("alt+cmd+left", function()
  keyStroke({"shift", "ctrl"}, "f18")
end, "Firefox")
onshortcut("alt+cmd+right", function()
  keyStroke({"shift", "ctrl"}, "f19")
end, "Firefox")
onshortcut("shift+alt+cmd+up", function()
  keyStroke({"ctrl", "alt"}, "f16")
end, "Firefox")
onshortcut("shift+alt+cmd+down", function()
  keyStroke({"ctrl", "alt"}, "f17")
end, "Firefox")
onshortcut("alt+cmd+down", function()
  keyStroke({"ctrl", "alt"}, "f18")
end, "Firefox")
onshortcut("alt+cmd+up", function()
  keyStroke({"ctrl", "alt"}, "f19")
end, "Firefox")
onshortcut("alt+cmd+t", function()
  keyStroke({"shift", "alt"}, "f16")
end, "Firefox")
onshortcut("alt+cmd+n", function()
  goClickAndMoveBack(17, 100)
  keyStroke({"shift", "alt"}, "f17")
end, "Firefox")
onshortcut("cmd+e", function()
  goClickAndMoveBack(50, 137)
end, "Firefox")

