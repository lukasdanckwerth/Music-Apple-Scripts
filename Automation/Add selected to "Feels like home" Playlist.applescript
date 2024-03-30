tell application "Music"
	if selection of front browser window is not {} then
		set thePlaylistName to "Feels Like Home"
		set theSelection to selection of front browser window
		repeat with aTrack in theSelection
			
			set trackName to name of aTrack
			set databaseID to database ID of aTrack
						
			if not ((1st track of user playlist thePlaylistName whose database ID is databaseID) exists) then
				duplicate aTrack to playlist thePlaylistName
				display notification "Track \"" & trackName & "\" was added to playlist \" & thePlaylistName & \"." with title "Track added"
			else
				display notification "Track \"" & trackName & "\" already in playlist \" & thePlaylistName & \"." with title "Not added"
			end if
			
		end repeat
	else
		display dialog "No tracks selected." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
	end if
end tell