on open theFolders
	repeat with theFolder in theFolders
		try
			tell application "Finder"
				set theName to the name of folder theFolder
				set theParent to the quoted form of POSIX path of (container of theFolder as alias)
				set thePath to the quoted form of POSIX path of theFolder
				do shell script "tar -czf " & theParent & quoted form of theName & ".tgz " & thePath
			end tell
		on error errorText
			display dialog errorText
		end try
	end repeat
end open