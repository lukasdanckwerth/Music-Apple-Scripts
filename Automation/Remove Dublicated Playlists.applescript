
log ("Removing dublicated playlists")

delay 10

on removePlaylist(thePlaylistName)
	
	tell application "Music"
		
		try
			
			set thePlaylist to user playlist thePlaylistName
			set theTracks to tracks of thePlaylist
			
			if (count of theTracks) > 0 then
				log ("Playlist has tracks '" & thePlaylistName & "'")
				delete thePlaylist
			else
				log ("Playlist has no tracks '" & thePlaylistName & "'")
			end if
			
		on error theErrorMessage
			
			log ("Cant't receive tracks of playlist '" & thePlaylistName & "'")
			log (theErrorMessage)
			
			return
			
		end try
	end tell
end removePlaylist


my removePlaylist("YouTube Singles 1")
my removePlaylist("YouTube Singles 2")
my removePlaylist("YouTube Singles 3")
my removePlaylist("YouTube Singles 4")
my removePlaylist("YouTube Singles 5")
my removePlaylist("YouTube Singles 6")

my removePlaylist("YouTube Automator 1")
my removePlaylist("YouTube Automator 2")
my removePlaylist("YouTube Automator 3")
my removePlaylist("YouTube Automator 4")
my removePlaylist("YouTube Automator 5")
my removePlaylist("YouTube Automator 6")

log ("Finished Removing dublicated playlists")
