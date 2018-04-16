-- create and add a location property for the new folder


tell application "Finder"
	make new folder at "Macintosh HD" with properties {name:"My_extra_folder"}
end tell