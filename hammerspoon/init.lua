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

