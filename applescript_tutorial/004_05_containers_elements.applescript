-- a file is an element of startup disk (something that startup disk can contain)

tell application "Finder"
	set var1 to every file of (startup disk)
end tell

-- in this case an empty array is returned because there are no files on the startup disc, only folders