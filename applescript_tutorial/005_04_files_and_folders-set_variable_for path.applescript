-- files and folders

-- to make it easier set a variable to the path and append that using &


-- example 1
tell application "Finder"
	set myFolderPath to (path to documents folder as string) & "test_folder"
	make new folder at myFolderPath
end tell

-- example 2
tell application "Atom"
	set filePath to (path to desktop folder as string) & "dictionaries.txt"
	open filePath
end tell