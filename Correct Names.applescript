tell application "Music"
	if selection is not {} then
		repeat with curTrack in selection
			
			set trackTitle to (name of curTrack) as Unicode text
			
			-- do shell script "cd ~/Library/Music/Scripts/"
			set name of curTrack to do shell script "~/Library/Music/Scripts/Luigis-Music-Scripts/ID3Corrector -t " & quoted form of trackTitle --as Unicode text
			
		end repeat
	end if
end tell


