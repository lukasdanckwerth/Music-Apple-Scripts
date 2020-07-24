
-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set tagCorrectorWorkDirPath to (file "removements.txt" of (folder ".tag-corrector" of (path to home folder)))
	set tagCorrectorWorkDirPath to quoted form of POSIX path of (tagCorrectorWorkDirPath as alias)
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorPath to (file "tag-corrector" of scriptsPath) as alias
	set correctorPath to quoted form of POSIX path of correctorPath
	
	-- use Music for genre correction
	tell application "Music"
		
		-- check for valid selection
		if selection is not {} then
			
			-- iterate selection and correct genre if necessarry
			repeat with curTrack in selection
				
				set oldName to (name of curTrack) as Unicode text
				
				set newName to do shell script correctorPath & " remove " & tagCorrectorWorkDirPath & " " & quoted form of oldName
				
				if oldName is not equal to newName then
					set name of curTrack to newName
				end if
			end repeat
		end if
	end tell
end tell

