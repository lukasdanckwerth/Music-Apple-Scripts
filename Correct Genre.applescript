
-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorPath to (file "tag-corrector" of scriptsPath) as alias
	set correctorPath to quoted form of POSIX path of correctorPath
	
	-- use Music for genre correction
	tell application "Music"
		
		-- check for valid selection
		if selection is not {} then
			
			-- iterate selection and correct genre if necessarry
			repeat with curTrack in selection
				
				-- receive old genre
				set oldGenre to (genre of curTrack) as Unicode text
				
				-- correct genre
				set newGenre to do shell script correctorPath & " correctGenre " & quoted form of oldGenre
				
				-- if genre was corrected set new genre
				if oldGenre is not equal to newGenre then
					set genre of curTrack to newGenre
				end if
			end repeat
		end if
	end tell
end tell

