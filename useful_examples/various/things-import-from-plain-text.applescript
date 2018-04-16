-- This script will import to-dos and notes into Things from a plaintext file.
-- To run the script, click the green "Run" button in the toolbar above.

set text_file to (choose file)
set database_text to read text_file

--process the file in reverse order to put first item at top of inbox
repeat with i from (count paragraphs of database_text) to 1 by -1
	set the_database_record to paragraph i of database_text
	set text item delimiters to tab
	set field_list to every text item of the_database_record
	set todoName to item 1 of field_list
	if (count of field_list) > 1 then
		set todoNotes to item 2 of field_list
	else
		set todoNotes to ""
		--ignores text beyond a second tab character
	end if
	
	tell application "Things"
		set newToDo to make new to do Â
			with properties {name:todoName} Â
			at end of list "Inbox"
		if todoNotes ­ "" then
			--only create a note if there was text after a tab
			set notes of newToDo to todoNotes
		end if
	end tell
end repeat