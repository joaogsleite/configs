hs.loadSpoon("RecursiveBinder")

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

function hotkeyBind(mods, key, cb, appName)
  hs.hotkey.bind(mods, key, function ()
    print(mods, key, appName)
    cb()
    return true
  end, nil, nil, appName)
end

local singleKey = spoon.RecursiveBinder.singleKey
local keyMap = {}
keyMap[singleKey("f","Finder")] = function() openApp("Finder") end
keyMap[singleKey("b","Firefox")] = function() openApp("Firefox") end
keyMap[singleKey("k","MacPass")] = function() openApp("MacPass") end
keyMap[singleKey("o","OrbStack")] = function() openApp("OrbStack") end
keyMap[singleKey("r","Reminders")] = function() openApp("Reminders") end
keyMap[singleKey("p","Preview")] = function() openApp("Preview") end
keyMap[singleKey("l","Blender")] = function() openApp("Blender") end
keyMap[singleKey("n","Notes")] = function() openApp("Notes") end
keyMap[singleKey("v","VSCode")] = function() openApp("Visual Studio Code") end
keyMap[singleKey("c","Chrome")] = function() openApp("Google Chrome") end
keyMap[singleKey("z","Terminal")] = function() openApp("Terminal") end
keyMap[singleKey("h","Home")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "03.xyz" })
end
keyMap[singleKey("t","Teams")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "teams.microsoft.com" })
end
keyMap[singleKey("w","WhatsApp")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "web.whatsapp.com" })
end
keyMap[singleKey("d","Discord")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "discord.com" })
end
keyMap[singleKey("g","Gmail")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "mail.google.com" })
end
keyMap[singleKey("i","ChatGPT")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "chatgpt.com" })
end
keyMap[singleKey("j","Jira")] = function()
  openApp("Firefox")
  wsSend({ command = "focusTab", url = "atlassian.net/jira" })
end
hotkeyBind({"cmd"}, "/", function()
  keyStroke({"ctrl", "shift"}, "f16")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "u", function()
  keyStroke({"ctrl", "shift"}, "f17")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "left", function()
  keyStroke({"ctrl", "shift"}, "f18")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "right", function()
  keyStroke({"ctrl", "shift"}, "f19")
end, "Firefox")
hotkeyBind({"shift","cmd","alt"}, "up", function()
  keyStroke({"ctrl", "alt"}, "f16")
end, "Firefox")
hotkeyBind({"shift","cmd","alt"}, "down", function()
  keyStroke({"ctrl", "alt"}, "f17")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "down", function()
  keyStroke({"ctrl", "alt"}, "f18")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "up", function()
  keyStroke({"ctrl", "alt"}, "f19")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "d", function()
  keyStroke({"alt", "shift"}, "f16")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "n", function()
  goClickAndMoveBack(17, 100)
  keyStroke({"alt", "shift"}, "f17")
end, "Firefox")
hotkeyBind({"cmd","alt"}, "e", function()
  goClickAndMoveBack(50, 137)
end, "Firefox")

local lead = spoon.RecursiveBinder.recursiveBind(keyMap)
if myKeyInterceptor then
  myKeyInterceptor:stop()
end
myKeyInterceptor = hs.eventtap.new(
  {hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown},
  function (event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()
    if (keyCode == 54 and flags.cmd) then
      local result = lead() 
      if result == nil then
        return true
      else
        return result
      end
    end
    return false
  end
)
myKeyInterceptor:start()
