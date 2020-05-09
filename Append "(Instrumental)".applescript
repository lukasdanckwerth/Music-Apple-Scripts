tell application "Music"
	if selection of front browser window is not {} then
		set curSelection to selection of front browser window
		repeat with curTrack in curSelection
			set name of curTrack to the name of curTrack & " (Instrumental)"
		end repeat
	else
		display dialog "No tracks have been selected." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
	end if
end tell