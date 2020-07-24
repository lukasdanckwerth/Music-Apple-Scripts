tell application "Music"
	
	set theMessage to "Please enter the text you want to append ..."
	set theTitle to "Append"
	set appending to the text returned of (display dialog theMessage with title theTitle default answer "")
	
	if selection of front browser window is not {} then
		set curSelection to selection of front browser window
		repeat with curTrack in curSelection
			set name of curTrack to the name of curTrack & appending
		end repeat
	else
		display dialog "No tracks have been selected." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
	end if
end tell