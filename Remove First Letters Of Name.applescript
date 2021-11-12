set countToRemoveFromStart to the text returned of (display dialog "Please enter the Number of Letters to remove?" default answer "")

tell application "Music"
	if selection is not {} then
		repeat with curTrack in selection
			set trackName to the name of curTrack
			set trackName to text (countToRemoveFromStart + 1) thru -1 of trackName
			set name of curTrack to trackName
		end repeat
	end if
end tell

