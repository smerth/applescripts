-- This App adds watermark information to images

global theImagesFolder
global textResponse



tell application "Finder"
	-- check if user has photoshop folder in the applications folder
	set hasPS to get exists folder ((path to applications folder as string) & "Adobe Photoshop CS6")
	-- set up variables to hold the path to the images folder and the names of the images
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell

-- Prompt the user to fill-in the comment they want to add to the images
display dialog "Fill in copyright to add to images" default answer "Copyright (c) 2015 All Rights Reserved" with title "Copyright text" with icon note buttons {"Ok", "Cancel"} default button 1
set textResponse to text returned of result

-- define a function to add comment
on addComment(theImage)
	-- add a comment to a file
	set theFile to (theImagesFolder & theImage) as string as alias
	tell application "Finder"
		set comment of theFile to textResponse
	end tell
end addComment

-- define a function to add comment
on addWatermark(theImage)
	-- add a watermark to a file using photoshop
end addWatermark

if hasPS is false then
	-- no photoshop
	repeat with anImage in theImages
		addComment(anImage)
	end repeat
else
	-- has photshop
	repeat with anImage in theImages
		addComment(anImage)
		addWatermark(anImage)
	end repeat
end if

-- ToDo: what is the output code for a successful program run, I want to convert a successful and unscucessful run to a notification of success or failure