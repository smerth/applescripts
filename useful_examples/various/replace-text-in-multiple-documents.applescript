-- explain this app
-- Make it an app
-- get search string from dialog box
-- get replacement keyword with dialog box



tell application "TextWrangler"
	set searchString to "  "
	set myCounter to 1
	repeat with i in (get text documents of front project window)
		tell i's text to replace searchString using "   " options {starting at top:true, search mode:grep}
		set myCounter to myCounter + 1
	end repeat
end tell