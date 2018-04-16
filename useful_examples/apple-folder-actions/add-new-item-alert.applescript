(*
add - new item alert

This Folder Action handler is triggered whenever items are added to the attached folder.
The script will display an alert containing the number of items added and offering the user
the option to reveal the added items in Finder.

Copyright © 2002Ð2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

property dialog_timeout : 30 -- set the amount of time before dialogs auto-answer.

on adding folder items to this_folder after receiving added_items
	try
		tell application "Finder"
			--get the name of the folder
			set the folder_name to the name of this_folder
		end tell
		
		-- find out how many new items have been placed in the folder
		set the item_count to the number of items in the added_items
		--create the alert string
		set alert_message to ("Folder Actions Alert:" & return & return) as Unicode text
		if the item_count is greater than 1 then
			set alert_message to alert_message & (the item_count as text) & " new items have "
		else
			set alert_message to alert_message & "One new item has "
		end if
		set alert_message to alert_message & "been placed in folder " & Çdata utxt201CÈ & the folder_name & Çdata utxt201DÈ & "."
		set the alert_message to (the alert_message & return & return & "Would you like to view the added items?")
		
		display dialog the alert_message buttons {"Yes", "No"} default button 2 with icon 1 giving up after dialog_timeout
		set the user_choice to the button returned of the result
		
		if user_choice is "Yes" then
			tell application "Finder"
				--go to the desktop 
				activate
				--open the folder
				open this_folder
				--select the items
				reveal the added_items
			end tell
		end if
	end try
end adding folder items to