set windowTitle to "Pessoal" -- change this to your window title
-- delay 10 -- uncomment this to let this app open while you add it to rcmd
tell application "Google Chrome"
	activate
	set windowList to windows
	repeat with w in windowList
		if (title of w contains windowTitle) then
			-- set active tab index of w to 1
			set index of w to 1
			exit repeat
		end if
	end repeat
end tell
-- export this script as an app, and add it to /Applications