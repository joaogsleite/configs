local obj={}
obj.__index = obj

function obj:updateMenu(muted)
	if muted then
		obj.mute_menu:setTitle("Muted")
	else
		obj.mute_menu:setTitle("On")
	end
end

function obj:isMicMuted()
  local mic = hs.audiodevice.defaultInputDevice()
	return mic:muted()
end

function obj:toggleMicMute()
	local mic = hs.audiodevice.defaultInputDevice()
	if mic:muted() then
		mic:setInputMuted(false)
		obj:updateMenu(false)
	else
		mic:setInputMuted(true)
		obj:updateMenu(true)
	end
end

function obj:init(mods, key)
	obj.mute_menu = hs.menubar.new()
	obj.mute_menu:setClickCallback(function()
		obj:toggleMicMute()
	end)
	obj:updateMenu(obj:isMicMuted())
	print(mods, key)
	self.hotkey = hs.hotkey.bind(mods, key, function()
    self:toggleMicMute()
  end)

	hs.audiodevice.watcher.setCallback(function(arg)
		if string.find(arg, "dIn ") then
			obj:updateMenu(obj:isMicMuted())
		end
	end)
	hs.audiodevice.watcher.start()
end

return obj