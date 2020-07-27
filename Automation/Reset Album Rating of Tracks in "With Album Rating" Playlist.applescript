#!/usr/bin/osascript

--on run argv
	
	set theNotificationTitle to "Reset Album Rating"
	
	display notification "Start" with title theNotificationTitle
	
	-- if (count of argv) is 0 then tell me to error "No playlist name specified."
	
	-- set thePlaylistName to (item 1 of argv) as text
	set thePlaylistName to "With Album Rating"
	
	tell application "Music"
		
		set numOfTracks to count of (tracks of user playlist thePlaylistName)
		
		if numOfTracks is greater than 0 then
			
			set theFirstTrack to first item of (tracks of user playlist thePlaylistName)
			set theArtistName to artist of theFirstTrack
			set trackName to name of theFirstTrack
			set theFullTrackName to theArtistName & " - " & trackName
			
			repeat with aTrack in tracks of user playlist thePlaylistName
				
				try
					
					if album rating kind of aTrack is computed then
						set album rating of aTrack to 1
					else
						set album rating of aTrack to 0
					end if
					
				on error theErrorMessage
					
					log ("Error: " & theErrorMessage)
					log ("Track: " & aTrack)
					
				end try
				
				delay 0.2
				
			end repeat
			
			if numOfTracks is 1 then
				set theMessage to "Reseted album rating of \"" & theFullTrackName & "\"."
			else
				set theMessage to "Reseted album rating of \"" & theFullTrackName & "\" and " & numOfTracks & " other tracks."
			end if
			
			display notification theMessage with title theNotificationTitle
			
		else
			display notification "No Tracks to reset album rating of" with title theNotificationTitle
			log ("no tracks in playlist")
		end if
		
	end tell
	
	log ("finished")
	
--end run
