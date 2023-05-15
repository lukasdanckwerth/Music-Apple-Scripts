-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set correctorFile to alias "usr:local:bin:tag-correct"
	-- set correctorFile to (file "tag-correct" of scriptsPath) as alias
	-- set correctorFile to POSIX path of "/usr/local/bin/tag-correct"
	set correctorPath to quoted form of POSIX path of correctorFile
	
	-- check whether tag-corrector is installed on the computer
	if exists correctorFile then
	
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