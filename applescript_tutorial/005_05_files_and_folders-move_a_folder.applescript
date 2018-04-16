-- files and folders

-- with paths sorted you can go to work... this time with "move"

tell application "Finder"
	set myFolderPath to (path to documents folder as string) & "test_folder"
	move folder myFolderPath to (path to desktop folder)
end tell
