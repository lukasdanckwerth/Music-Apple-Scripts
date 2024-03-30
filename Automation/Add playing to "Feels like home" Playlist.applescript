tell application "Music"
	if exists name of current track then
		
		set theTrack to current track
		set thePlaylistName to "Feels Like Home"
		set trackName to name of theTrack
		set databaseID to database ID of theTrack
		
		if not ((1st track of user playlist thePlaylistName whose database ID is databaseID) exists) then
			duplicate theTrack to playlist thePlaylistName
			display notification "Track \"" & trackName & "\" was added to playlist \"" & thePlaylistName & "\"." with title "Track added"
		else
			display notification "Track \"" & trackName & "\" already in playlist \"" & thePlaylistName & "\"." with title "Not added"
		end if
	else
		display dialog "No track is playing." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
	end if
end tell