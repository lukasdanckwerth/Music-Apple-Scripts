-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorFile to (file "tag-corrector" of scriptsPath) as alias
	set correctorPath to quoted form of POSIX path of correctorFile
	
	-- check whether tag-corrector is installed on the computer
	if (exists correctorFile) then
		
		-- use Music for genre correction
		tell application "Music"
			
			-- check for valid selection
			if selection is not {} then
				
				-- iterate selection and correct genre if necessarry
				repeat with curTrack in selection
					
					-- receive track title
					set trackTitle to (name of curTrack) as Unicode text
					
					-- correct genre
					set newTitle to do shell script correctorPath & " correctName " & quoted form of trackTitle
					
					-- if title was corrected set new title
					if trackTitle is not equal to newTitle then
						set name of curTrack to newTitle
					end if
				end repeat
			end if
		end tell
	else
		
		-- tag-corrector doesn't exist
		display dialog "Underlying TagCorrector binary (" & correctorPath & ") doesn't exist."
	end if
end tell