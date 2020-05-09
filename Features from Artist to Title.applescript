tell application "Music"
	if selection is not {} then
		repeat with curTrack in selection
			
			set tmpArtist to (artist of curTrack) as Unicode text
			set formatedArtist to do shell script "~/Library/iTunes/Scripts/ID3Corrector -t " & quoted form of tmpArtist
			set onlyArtist to do shell script "~/Library/iTunes/Scripts/ID3Corrector -oa " & "\"" & formatedArtist & "\""
			set onlyFeat to do shell script "~/Library/iTunes/Scripts/ID3Corrector -of " & "\"" & formatedArtist & "\""
			
			if onlyArtist is not "" then
				set artist of curTrack to onlyArtist
			end if
			
			if onlyFeat is not "" then
				set name of curTrack to name of curTrack & " (feat. " & onlyFeat & ")"
			end if
		end repeat
	end if
end tell