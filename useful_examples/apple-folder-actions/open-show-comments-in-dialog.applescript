(*
open - show comments in dialog

This Folder Action handler is triggered whenever the attached folder is opened.  The script displays
a dialog showing the information from the attached folder's Spotlight Comments field.

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

on opening folder this_folder
	tell application "Finder"
		activate
		set the alert_message to the comment of this_folder
		if the alert_message is not "" then
			display dialog alert_message buttons {"Open Comments", "Clear Comments", "OK"} default button 3 giving up after dialog_timeout
			set the user_choice to the button returned of the result
			if the user_choice is "Clear Comments" then
				set comment of this_folder to ""
			else if the user_choice is "Open Comments" then
				open information window of this_folder
			end if
		end if
	end tell
end opening folder