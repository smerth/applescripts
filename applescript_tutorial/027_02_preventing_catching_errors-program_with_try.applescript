-- This App adds copyright text to images as a comment to the file and a watermark on the image.
-- This App requires some version of Photoshop to be installed.

global theImagesFolder
global textResponse

-- check if user has photoshop folder in the applications folder, and set variables for the filepath to images and the image names

tell application "Finder"	
	set hasPS to get exists folder ((path to applications folder as string) & "Adobe Photoshop CS6")
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell

-- Prompt the user to fill-in the comment they want to add to the images

display dialog "Fill in copyright to add to images" default answer "Copyright (c) 2015 All Rights Reserved by Smerth" with title "Copyright text" with icon note buttons {"Ok", "Cancel"} default button 1
set textResponse to text returned of result

-- define a function to add comment to a file

on addComment(theImage)
	set theFile to (theImagesFolder & theImage) as string as alias
	tell application "Finder"
		set comment of theFile to textResponse
	end tell
end addComment

-- define a function to add text to an image as a layer in Photoshop

on addWatermark(theImage)
	tell application "Photoshop"
		set theFile to (theImageFolder & theImage) as string
		
		
		tell application "Finder"
		set fileType to the kind of (theFile as alias)
		end tell
		
		if fileType does not contain "image" then
			-- do nothing, could send a notification to user
			else
			
		try
		
			
		open alias theFile
		set myTextLayer to make new art layer in the current document with properties {kind:text layer}
		set properties of text object in myTextLayer to {contents:"textResponse", size:24, font:"Ariel", position:{0.4,1}, faux italic:true}
		set opacity of myTextLayer to 30
		rotate myTextLayer angle 30
		flatten the current document
		save the current document
		close the current document
		
		on error errorText
		display notification "Oops!: " & errorText
		end try
		
		end if
	end tell
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

