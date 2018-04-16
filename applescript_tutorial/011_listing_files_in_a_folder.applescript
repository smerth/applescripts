-- you can't get files from a string so the Images folder is cast as an alias
-- the name is a property of an item (files)
tell application "Finder"
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell