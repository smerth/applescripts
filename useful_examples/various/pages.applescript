global pathToPages

tell application "Finder"
	-- check if the "pages" folder exists on the desktop
	set folderExists to exists of (folder "pages" of (path to desktop folder))
	
	-- set a variable path to the pages folder 
	set pathToFolder to (path to desktop folder as string) & "pages"
	
	-- set variable for the pages folder
	
	
	-- retrieve names of files in the folder
	set theFolder to ((path to desktop folder) & "pages" as string as alias)
	set thePages to every file of theFolder
	
end tell

tell application "TextWrangler"
	open thePages
end tell

