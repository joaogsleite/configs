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

function keyStroke(flags, key)
  hs.eventtap.keyStroke(flags, key)
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
  print(hs.inspect(shortcutBindings))
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
onshortcut("rcmd+t", function() 
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F1")
end)
onshortcut("rcmd+w", function() 
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F2")
end)
onshortcut("rcmd+d", function() 
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F3")
end)
onshortcut("rcmd+g", function() 
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F4")
end)
onshortcut("rcmd+i", function() 
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F5")
end)
onshortcut("rcmd+j", function()
  openApp("Firefox")
  keyStroke({"ctrl", "alt"}, "F6")
end)
onshortcut("alt+cmd+up", function() 
  keyStroke({"ctrl", "alt"}, "up")
end,"Firefox")
onshortcut("alt+cmd+down", function() 
  keyStroke({"ctrl", "alt"}, "down")
end, "Firefox")
onshortcut("alt+cmd+left", function()
  keyStroke({"ctrl", "alt"}, "left")
end, "Firefox")
onshortcut("alt+cmd+right", function()
  keyStroke({"ctrl", "alt"}, "right")
end, "Firefox")
onshortcut("cmd+e", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local originalPos = hs.mouse.getAbsolutePosition()
  local targetPos = hs.geometry.point(f.x + 50, f.y + 137)
  hs.eventtap.leftClick(targetPos)
  hs.timer.usleep(10000)
  hs.eventtap.leftClick(targetPos)
  hs.mouse.setAbsolutePosition(originalPos)
end, "Firefox")
