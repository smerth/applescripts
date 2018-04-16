(*
Image - Rotate Right

This Folder Action handler is triggered whenever items are added to the attached folder.
The script rotates the image clockwise (right).

Copyright © 2002Ð2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

property done_foldername : "Rotated Images"
-- the list of file types which will be processed 
-- eg: {"PICT", "JPEG", "TIFF", "GIFf"} 
property type_list : {"JPEG", "TIFF", "PNGf"}
-- since file types are optional in Mac OS X, 
-- check the name extension if there is no file type 
-- NOTE: do not use periods (.) with the items in the name extensions list 
-- eg: {"txt", "text", "jpg", "jpeg"}, NOT: {".txt", ".text", ".jpg", ".jpeg"} 
property extension_list : {"jpg", "jpeg", "tif", "tiff", "png"}


on adding folder items to this_folder after receiving these_items
	-- CHECK FOR THE DESTINATION FOLDER WITHIN THE ATTACHED FOLDER
	-- IF IT DOESN'T EXIST, THEN CREATE IT
	tell application "Finder"
		if not (exists folder done_foldername of this_folder) then
			make new folder at this_folder with properties {name:done_foldername}
			set current view of container window of this_folder to list view
		end if
		set the target_folder to folder done_foldername of this_folder
	end tell
	-- PROCESS EACH OF THE ITEMS ADDED TO THE ATTACHED FOLDER
	try
		repeat with i from 1 to number of items in these_items
			set this_item to item i of these_items
			set the item_info to the info for this_item
			-- CHECK TO SEE IF THE ITEM IS AN IMAGE FILE OF THE ACCEPTED FILE TYPE
			if (alias of the item_info is false and the file type of the item_info is in the type_list) or (the name extension of the item_info is in the extension_list) then
				tell application "Finder"
					-- LOOK FOR EXISTING MATCHING ITEMS IN THE DESTINATION FOLDER
					-- IF THERE ARE MATCHES, THEN RENAME THE CONFLICTING FILES INCREMENTALLY
					my resolve_conflicts(this_item, target_folder)
					-- MOVE THE ITEM TO THE DESTINATION FOLDER
					set the target_file to (move this_item to the target_folder with replacing) as alias
				end tell
				-- PROCESS THE ITEM
				process_item(target_file)
			end if
		end repeat
	on error error_message number error_number
		if the error_number is not -128 then
			tell application "Finder"
				activate
				display dialog error_message buttons {"Cancel"} default button 1 giving up after 120
			end tell
		end if
	end try
end adding folder items to

on resolve_conflicts(this_item, target_folder)
	tell application "Finder"
		set the file_name to the name of this_item
		if (exists document file file_name of target_folder) then
			set file_extension to the name extension of this_item
			if the file_extension is "" then
				set the trimmed_name to the file_name
			else
				set the trimmed_name to text 1 thru -((length of file_extension) + 2) of the file_name
			end if
			set the name_increment to 1
			repeat
				set the new_name to (the trimmed_name & "." & (name_increment as string) & "." & file_extension) as string
				if not (exists document file new_name of the target_folder) then
					-- rename to conflicting file
					set the name of document file file_name of the target_folder to the new_name
					exit repeat
				else
					set the name_increment to the name_increment + 1
				end if
			end repeat
		end if
	end tell
end resolve_conflicts

-- this sub-routine processes files 
on process_item(this_item)
	-- NOTE that the variable this_item is a file reference in alias format 
	-- FILE PROCESSING STATEMENTS GOES HERE 
	try
		-- convert alias reference to string
		set this_item to this_item as string
		with timeout of 900 seconds
			tell application "Image Events"
				launch -- always use with Folder Actions
				set this_image to open file this_item
				rotate this_image to angle 90.0
				save this_image with icon
				close this_image
			end tell
		end timeout
	on error error_message
		tell application "Finder"
			activate
			display dialog error_message buttons {"Cancel"} default button 1 giving up after 120
		end tell
	end try
end process_item