-- This app adds a copyright text to comments property of a file 
-- and a copyright text watermark to image files
-- Place image files in a folder called "Images" on the desktop

global theImagesFolder
global textReceived

-- check if user has GraphicConverter 9.app in the applications folder and set variables for the path to image files and the image file names

tell application "Finder"
	set hasGraphicConverter to get exists file ((path to applications folder as string) & "GraphicConverter 9.app")
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell

-- Prompt the user to fill-in the text they want to add to the images capture their input as the global variable "textReceived"

display dialog "Fill in copyright info to add to images" default answer "Copyright (c) 2015 All Rights Reserved by Smerth" with title "Copyright text" with icon note buttons {"Ok", "Cancel"} default button 1
set textReceived to text returned of result

-- write a function to add comment to a file (do this as a function since you are going to call it more than once)

on addComment(theImage)
	set theFile to (theImagesFolder & theImage) as string as alias
	tell application "Finder"
		set comment of theFile to textReceived
	end tell
end addComment

-- define a function to use Graphic Convertor to add a "text watermark" to an image

on addWatermark(theImage)
	tell application "GraphicConverter 9"
		set theFile to (theImagesFolder & theImage) as string
		open alias theFile
		
		(*
		Can't find a command to add a layer to take text within the Graphic Converter Dictionary
		You can add text to a window but not an image...
		*)
		
		(*
		To add a watermark in Photoshop:
		set myTextLayer to make new art layer in the current document with properties {kind:text layer}
		set properties of text object in myTextLayer to {contents:"textReceived", size:24, font:"Ariel", position:{0.4,1}, faux italic:true}
		set opacity of myTextLayer to 30
		rotate myTextLayer angle 30
		flatten the current document
		save the current document
		close the current document
		*)
	end tell
end addWatermark


if hasGraphicConverter is false then
	-- no Graphic Converter progam in Applications
	repeat with anImage in theImages
		addComment(anImage)
	end repeat
else
	-- has Graphic Converter
	repeat with anImage in theImages
		addComment(anImage)
		addWatermark(anImage)
	end repeat
end if

