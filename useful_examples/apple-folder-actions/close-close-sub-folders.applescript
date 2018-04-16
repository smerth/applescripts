(*
close - close sub-folders

This Folder Action handler is triggered when the attached folder is closed.  It will close the open 
windows of folders within the attached folder.

Copyright © 2002Ð2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

on closing folder window for this_folder
	tell application "Finder"
		repeat with EachFolder in (get every folder of folder this_folder)
			try
				close window of EachFolder
			end try
		end repeat
	end tell
end closing folder window for