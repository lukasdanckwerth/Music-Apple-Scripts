on run argv
	tell application "Music"
		
		set inputGenre to ""
		if (count of argv) is 0 then
			set theMessage to "Please enter the genre you want to set ..."
			set theTitle to "Set Genre"
			set inputGenre to the text returned of (display dialog theMessage with title theTitle default answer "")
		else
			set inputGenre to item 1 of argv
		end if
		
		if selection of front browser window is not {} then -- if tracks are selected...
			set curSelection to selection of front browser window
			repeat with curTrack in curSelection
				set genre of curTrack to inputGenre
			end repeat
		else
			display dialog "No tracks have been selected." buttons {"Cancel"} default button 1 with icon 0 giving up after 30
		end if -- no selection
	end tell
end run