
log ("Start Moving Files")

set theNotificationTitle to "Automated Moving Files"

set theSourcePlaylistName to "To Be Added To Gareths Golden Era"
set theTargetPlaylistName to "Gareths Golden Era"

set theCountTracksMoved to 0
set theCountTracksTotal to 0
set trackName to ""

tell application "Music"
	
	try
		set theTracks to tracks of user playlist theSourcePlaylistName
	on error theErrorMessage
		log ("Cant't receive tracks of source playlist.")
		log (theErrorMessage)
		display notification "Cant't receive tracks of playlist '" & theSourcePlaylistName & "'." with title theNotificationTitle
		return
	end try
	
	try
		set theTargetTracks to tracks of user playlist theTargetPlaylistName
	on error theErrorMessage
		log ("Cant't receive tracks of target playlist.")
		log (theErrorMessage)
		display notification "Cant't receive tracks of playlist '" & theSourcePlaylistName & "'." with title theNotificationTitle
		return
	end try
	
	repeat with aTrack in theTracks
		
		set theCountTracksTotal to theCountTracksTotal + 1
		set trackName to name of aTrack
		set databaseID to database ID of aTrack
		
		log (databaseID)
		
		if not ((1st track of user playlist theTargetPlaylistName whose database ID is databaseID) exists) then
			duplicate aTrack to playlist theTargetPlaylistName
			log ("exists")
			set theCountTracksMoved to theCountTracksMoved + 1
		end if
		
		if theCountTracksTotal is not 1 then
			log ("remvoe")
			tell playlist theSourcePlaylistName to delete contents of aTrack
		end if
		
	end repeat
	
	tell application "Finder"
		if theCountTracksMoved is 1 then
			display notification "\"" & trackName & "\" was moved to playlist \"" & theTargetPlaylistName & "\"." with title theNotificationTitle
		else if theCountTracksMoved is not 0 then
			display notification "\"" & trackName & "\" and " & theCountTracksMoved & " other tracks were moved to playlist \"" & theTargetPlaylistName & "\"." with title theNotificationTitle
		else
			display notification "No Tracks to move to playlist \"" & theTargetPlaylistName & "\"" with title theNotificationTitle
		end if
	end tell
	
end tell

log ("Finished Moving Files")
