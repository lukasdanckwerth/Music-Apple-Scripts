set appending to the text returned of (display dialog "Please enter the text you want to add in the beginning ..." with title "What to add?" default answer "")

tell application "Music"
	if selection is not {} then
		repeat with curTrack in selection
			set album of curTrack to (appending & album of curTrack)
		end repeat
	end if
end tell

