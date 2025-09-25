local wf = hs.window.filter.new()
wf:subscribe(hs.window.filter.windowCreated, function(win, appName)
  if not win then return end
  
  -- Ignore non-standard windows
  if not win:isStandard() then return end
  
  -- Ignore system dialogs (by app name)
  local ignoredApps = {
    "SecurityAgent",     -- macOS password prompts
    "System Preferences",
  }
  for _, name in ipairs(ignoredApps) do
    if appName == name then return end
  end
  
  -- Ignore modal / alert windows
  local subrole = win:subrole()
  if subrole == "AXSystemDialog" or subrole == "AXDialog" then
    return
  end
  
  -- Apply maximize
  hs.timer.doAfter(0.01, function()
    win:maximize()
  end)
end)
