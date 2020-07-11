tell application "Music"
	if exists name of current track then
		set rating of current track to 0
		set theName to name of current track
		set theArtist to artist of current track
		display notification "0 Stars for '" & theName & "' from " & theArtist
		play (next track)
	else
		display dialog "No track playing." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
	end if -- no selection
end tell