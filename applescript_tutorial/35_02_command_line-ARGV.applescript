-- Use argv to pass in an argument from the command line
-- osascript "myscript copy.scpt" Artigiano
-- returns the Alert "Hello Artigiano"


on run argv
	display alert "Hello " & item 1 of argv
end run