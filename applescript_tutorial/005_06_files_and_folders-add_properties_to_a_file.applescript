-- files and folders

-- working with files
-- check the dictionary for the file class to see what properties you can set

tell application "Finder"
	make new file at (path to desktop folder) with properties {name:"my_empty_file", file type:"text"}
end tell

(*

file n [inh. item] : A file

properties

file type (type) : the OSType identifying the type of data contained in the item
creator type (type) : the OSType identifying the application that created the item
stationery (boolean) : Is the file a stationery pad?
product version (text, r/o) : the version of the product (visible at the top of the “Get Info” window)
version (text, r/o) : the version of the file (visible at the bottom of the “Get Info” window)

*)