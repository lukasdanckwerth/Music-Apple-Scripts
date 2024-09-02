tell application "Music"
	if selection is not {} then
		set firstTrack to first item of selection
		set trackName to album of firstTrack
		set theMessage to "Please enter the number of character to remove from the beginning of the album title \"" & trackName & "\"?"
		set countToRemoveFromStart to the text returned of (display dialog theMessage default answer "")
		repeat with curTrack in selection
			set trackAlbum to the album of curTrack
			set trackAlbum to text (countToRemoveFromStart + 1) thru -1 of trackAlbum
			set album of curTrack to trackAlbum
		end repeat
	else
		display dialog "No Tracks selected."
	end if
end tell

