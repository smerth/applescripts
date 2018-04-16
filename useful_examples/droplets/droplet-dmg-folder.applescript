on open theFolder
	try
		tell application "Finder"
			set theName to the name of folder theFolder
			set theParent to the quoted form of POSIX path of (container of theFolder)
			set thePath to the quoted form of POSIX path of theFolder
			do shell script "hdiutil create -srcfolder" & space & theParent & quoted form of theName & space & thePath & quoted form of theName & ".dmg" & thePath
			

			
		end tell
	on error errorText
		display dialog errorText
	end try
end open