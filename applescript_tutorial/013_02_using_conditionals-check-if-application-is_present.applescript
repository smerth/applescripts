-- This App adds watermark information to images

-- Using conditionals (checking if photoshop is in the apps folder)

tell application "Finder"
	
	set hasPS to get exists folder ((path to applications folder as string) & "Adobe Photoshop CS6")
	set theImagesFolder to ((path to desktop folder) & "Images" as string as alias)
	set theImages to the name of every file of theImagesFolder
end tell

if hasPS is false then
	-- no photoshop
	repeat with anImage in theImages
		
	end repeat
else
	-- has photshop
	repeat with anImage in theImages
		
	end repeat
end if

