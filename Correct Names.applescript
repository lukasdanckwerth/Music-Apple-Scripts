-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorPath to (file "tag-corrector" of scriptsPath) as alias
	
	-- check whether tag-corrector is installed on the computer
	if exists correctorPath then
		
		set correctorPath to quoted form of POSIX path of correctorPath
		
		-- use Music for genre correction
		tell application "Music"
			
			-- check for valid selection
			if selection is not {} then
				
				-- iterate selection and correct genre if necessarry
				repeat with curTrack in selection
					
					-- receive track title
					set trackTitle to (name of curTrack)
					
					-- correct genre
					set newTitle to do shell script correctorPath & " correctName " & quoted form of trackTitle
					
					-- -- if title was corrected set new title
					considering case
						if trackTitle is not equal to newTitle then
							set name of curTrack to newTitle
						end if
					end considering
				end repeat
			end if
		end tell
	else
		
		-- tag-corrector doesn't exist
		display dialog "Underlying TagCorrector binary (" & correctorPath & ") doesn't exist."
	end if
end tell