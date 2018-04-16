-- script files must be placed in: /Library/Scripts/Folder Action Scripts/
-- FOR A FOLDER: under the options menu attach an action...

on adding folder items to thisFolder after receiving someItems
	tell application "Finder"
		try
			repeat with thisItem in someItems
				set theName to name of thisItem
				display notification with title name of thisFolder as string subtitle theName & " has been added to " & name of thisFolder as string
			end repeat
		on error errorText
			display alert errorText
		end try
	end tell
end adding folder items to