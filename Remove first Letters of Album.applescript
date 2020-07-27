set countToRemoveFromStart to the text returned of (display dialog "Please enter the Number of Letters to remove?" default answer "")

tell application "Music"
	if selection is not {} then
		repeat with curTrack in selection
			set trackAlbum to the album of curTrack
			set trackAlbum to text (countToRemoveFromStart + 1) thru -1 of trackAlbum
			set album of curTrack to trackAlbum
		end repeat
	end if
end tell

