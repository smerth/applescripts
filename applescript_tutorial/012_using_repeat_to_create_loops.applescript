-- Creating and working with Loops

-- you can't get files from a string so the Images folder is cast as an alias
-- the name is a property of an item (files)
tell application "Finder"
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
	
	
	-- If you just want the position of items in the list
	set myOutput to "I see"
	repeat with i from 1 to the count of theImages
		set myOutput to myOutput & " " & i & " - " & item i of theImages
	end repeat
	
	(*
	-- a way to work with the actual image (file) object
	set myOutput to "I see"
	repeat with anImage in theImages
		set myOutput to myOutput & " " & anImage
	end repeat
	*)
	
end tell

-- return breaks you out of a loop. If you have three nested loops with return in the third nested loop AppleScript will travel into the nested loops until it reaches the return then back out a level and carry on