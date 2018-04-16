
-- a folder is an element of startup disk (something that startup disk can contain)

tell application "Finder"
	set var1 to every folder of (startup disk)
end tell