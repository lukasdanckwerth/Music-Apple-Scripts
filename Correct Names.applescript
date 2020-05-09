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
					
					-- receive track title
					set trackTitle to (name of curTrack) as Unicode text
					
					-- correct genre
					set newTitle to do shell script "/usr/local/bin/tag-corrector correctName " & quoted form of trackTitle
					
					-- if title was corrected set new title
					if trackTitle is not equal to newTitle then
						set name of curTrack to newTitle
					end if
				end repeat
			end if
		end tell
	else
		
		-- tag-corrector doesn't exist
		display dialog "Underlying TagCorrector binary (/usr/local/bin/tag-corrector) doesn't exist."
	end if
end tell