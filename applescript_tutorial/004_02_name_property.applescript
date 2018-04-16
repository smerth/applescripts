-- name is a property of the folder "desktop"

tell application "Finder"
	set var1 to the name of (path to desktop)
end tell

-- here path to desktop is like an alias ot the desktop folder item