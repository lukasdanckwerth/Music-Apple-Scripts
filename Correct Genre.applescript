-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	-- check whether tag-corrector is installed on the computer
	if (exists POSIX file "/usr/local/bin/tag-corrector") then
		
		-- use Music for genre correction
		tell application "Music"
			
			-- check for valid selection
			if selection is not {} then
				
				-- iterate selection and correct genre if necessarry
				repeat with curTrack in selection
					
					-- receive old genre
					set oldGenre to (genre of curTrack) as Unicode text
					
					-- correct genre
					set newGenre to do shell script "/usr/local/bin/tag-corrector correctGenre " & quoted form of oldGenre
					
					-- if genre was corrected set new genre
					if oldGenre is not equal to newGenre then
						set genre of curTrack to newGenre
					end if
				end repeat
			end if
		end tell
	else
	
		-- tag-corrector doesn't exist
		display dialog "Underlying TagCorrector binary (/usr/local/bin/tag-corrector) doesn't exist."
	end if
end tell

