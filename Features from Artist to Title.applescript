tell application "Music"
set theSelection to selection of front browser window
	if theSelection is not {} then
		repeat with curTrack in theSelection
			
			set theArtistString to (artist of curTrack) as Unicode text
			set onlyArtist to do shell script "~/Library/Music/Scripts/tag-corrector getArtist " & "\"" & theArtistString & "\""
			set onlyFeat to do shell script "~/Library/Music/Scripts/tag-corrector getFeature " & "\"" & theArtistString & "\""
			
			if onlyArtist is not "" then
				set artist of curTrack to onlyArtist
			end if
			
			if onlyFeat is not "" then
				set name of curTrack to name of curTrack & " (feat. " & onlyFeat & ")"
			end if
		end repeat
	end if
end tell