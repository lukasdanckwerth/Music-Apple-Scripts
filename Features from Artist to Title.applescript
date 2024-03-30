-- use Finder to check for tag-corrector existence
tell application "Finder"
	
	set scriptsPath to folder "Scripts" of (folder "Music" of (folder "Library" of (path to home folder)))
	set correctorPath to (file "tag-corrector" of scriptsPath) as alias
	
	-- check whether tag-corrector is installed on the computer
	if exists correctorPath then
		
		set correctorPath to quoted form of POSIX path of correctorPath
		
		-- use Music for genre correction
		tell application "Music"
			
			set theSelection to selection of front browser window
			
			if theSelection is not {} then
				repeat with curTrack in theSelection
					
					set theArtistString to (artist of curTrack)
					set onlyArtist to do shell script correctorPath & " getArtist " & quoted form of theArtistString
					set onlyFeat to do shell script correctorPath & " getFeature " & quoted form of theArtistString
					
					if onlyArtist is not "" then
						set artist of curTrack to onlyArtist
					end if
					
					if onlyFeat is not "" then
						set name of curTrack to name of curTrack & " (feat. " & onlyFeat & ")"
					end if
				end repeat
			end if
		end tell
	else
		-- tag-corrector doesn't exist
		display dialog "Underlying TagCorrector binary (" & correctorPath & ") doesn't exist."
	end if
end tell

