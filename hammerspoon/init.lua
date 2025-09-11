require("rcmd")

hs.hotkey.bind({"cmd"}, "e", function()
  local frontApp = hs.application.frontmostApplication()
  if frontApp:name() == "Firefox" then
    local originalPos = hs.mouse.getAbsolutePosition()
    local targetPos = hs.geometry.point(50, 175)
    hs.eventtap.leftClick(targetPos)
    hs.timer.usleep(20000)
    hs.eventtap.leftClick(targetPos)
    hs.mouse.setAbsolutePosition(originalPos)
  end
end)

-- Single eventtap for all Right Cmd shortcuts
local cmdRKeyCode = 54 -- cmd right key code
local cmdRDown = false
local keyDownStates = {} -- track per-key press state
local cmdRBindings = {} -- keyCode -> {fn = callback, swallow = bool}

-- The main bind function
function hs.hotkey.bindCmdR(key, callback, opts)
    opts = opts or {}
    local keyCode = hs.keycodes.map[string.lower(key)]
    if not keyCode then
        hs.alert.show("bindRightCmd: unknown key '" .. tostring(key) .. "'")
        return
    end
    cmdRBindings[keyCode] = {fn = callback, swallow = opts.swallow == true}
    return keyCode
end

-- Optional unbind
function hs.hotkey.unbindCmdR(key)
    local keyCode = hs.keycodes.map[string.lower(key)]
    if keyCode then
        cmdRBindings[keyCode] = nil
        keyDownStates[keyCode] = nil
    end
end

-- Single eventtap
if not hs.hotkey._rightCmdTap then
    hs.hotkey._cmdRTap = hs.eventtap.new(
        {hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp},
        function(event)
            local kc = event:getKeyCode()
            local et = event:getType()
            local flags = event:getFlags()

            -- Track right Cmd
            if et == hs.eventtap.event.types.flagsChanged and kc == cmdRKeyCode then
                cmdRDown = flags.cmd
                return false
            end

            -- KeyDown: trigger callback
            if cmdRDown and et == hs.eventtap.event.types.keyDown then
                if not keyDownStates[kc] then
                    keyDownStates[kc] = true
                    local binding = cmdRBindings[kc]
                    if binding then
                        pcall(binding.fn, event)
                        return true -- swallow event so OS never sees it
                    end
                end
            end

            -- KeyUp: reset key state
            if et == hs.eventtap.event.types.keyUp then
                keyDownStates[kc] = false
            end

            return false
        end
    )
    hs.hotkey._cmdRTap:start()
end

hs.hotkey.bindCmdR("b", function()
  hs.application.launchOrFocus("Firefox")
end)
hs.hotkey.bindCmdR("f", function() 
  hs.application.launchOrFocus("Finder")
end)
hs.hotkey.bindCmdR("v", function() 
  hs.application.launchOrFocus("Visual Studio Code")
end)
hs.hotkey.bindCmdR("c", function() 
  hs.application.launchOrFocus("Google Chrome")
end)
hs.hotkey.bindCmdR("z", function() 
  hs.application.launchOrFocus("Terminal")
end)
hs.hotkey.bindCmdR("t", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F1")
end)
hs.hotkey.bindCmdR("w", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F2")
end)
hs.hotkey.bindCmdR("d", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F3")
end)
hs.hotkey.bindCmdR("g", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F4")
end)
hs.hotkey.bindCmdR("i", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F5")
end)
hs.hotkey.bindCmdR("j", function() 
  hs.application.launchOrFocus("Firefox")
  hs.eventtap.keyStroke({"ctrl", "alt"}, "F6")
end)
