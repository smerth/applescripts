-- files and folders

-- working with files
-- under standard suite you will find "exists"

tell application "Finder"
	set fileExists to exists of (file "my_empty_file" of (path to desktop folder))
end tell

-- here you are setting the result of the exists command executed on a file at a speficied path to the varible "fileExists".  That result is the boolean: true or false