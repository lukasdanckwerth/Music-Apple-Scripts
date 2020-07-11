-- use Finder to check for tag-corrector existence
tell application "Finder"

	-- receive path to this script
	set current_path0 to container of (path to me) as alias
	set correctorPath to quoted form of ((POSIX path of current_path0) & "tag-corrector")

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

