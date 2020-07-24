
-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set tagCorrectorWorkDirPath to (file "removements.txt" of (folder ".tag-corrector" of (path to home folder)))
	set tagCorrectorWorkDirPath to quoted form of POSIX path of (tagCorrectorWorkDirPath as alias)
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorPath to (file "tag-corrector" of scriptsPath) as alias
	set correctorPath to quoted form of POSIX path of correctorPath
	
	-- use Music for genre correction
	tell application "Music"
		
		set thePlaylistName to "Added Last Week (YouTube Automator)"
		set trackIndex to 0
		set trackName to ""
		
		set theTracks to tracks of user playlist thePlaylistName
		
		repeat with aTrack in theTracks
			
			set oldName to (name of aTrack) as Unicode text
			set newName to do shell script correctorPath & " remove " & tagCorrectorWorkDirPath & " " & quoted form of oldName
			
			if oldName is not equal to newName then
				set name of aTrack to newName
				set trackIndex to trackIndex + 1
			end if
			
		end repeat
		
		if trackIndex is 1 then
			display notification "\"" & trackName & "\" was corrected" with title thePlaylistName
		else if trackIndex is not 0 then
			display notification "\"" & trackName & "\" and " & trackIndex & " other tracks were corrected" with title thePlaylistName
		else
			display notification "No names corrected" with title thePlaylistName
		end if
	end tell
end tell

