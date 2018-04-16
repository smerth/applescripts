-- This App adds watermark information to images

-- Using conditionals

tell application "Finder"
	
	set hasPS to get exists folder ((path to applications folder as string) & "Adobe Photoshop CS6")
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell

on addComment(theImage, theImagesFolder)
	-- add a comment to a file
	-- note theImagesFolder must be passed in because it is defined outside the scope of the function
	set theFile to (theImagesFolder & theImage) as string as alias
	tell application "Finder"
		open theFile
	end tell
end addComment

on addWatermark(theImage)
	-- add a watermark to a file using photoshop
end addWatermark

if hasPS is false then
	-- no photoshop
	repeat with anImage in theImages
		addComment(anImage, theImagesFolder)
	end repeat
else
	-- has photshop
	repeat with anImage in theImages
		addComment(anImage, theImagesFolder)
		addWatermark(anImage)
	end repeat
end if

