-- an item is the archtypal class, all other object classes inherit from it
-- items have properties, for example "path to"

tell application "Finder"
	set var1 to every item of (path to desktop)
end tell