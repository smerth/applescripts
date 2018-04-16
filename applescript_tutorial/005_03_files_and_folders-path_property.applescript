-- a path is written: at folder "Documents" of folder "Smerth" of folder "User" of folder "Macintosh HD" 

tell application "Finder"
	make new folder at folder "Desktop" of folder "smerth" of folder "Users" of folder "Macintosh HD" with properties {name:"My_Super_Folder"}
end tell

(*
There are three ways to write out a path:

1) Explicit
at folder "Documents" of folder "smerth" of folder "Users" of folder "Macintosh HD"

2) POSIX
at "/Macintosh HD/Users/smerth/Documents/"
Note the preceding and trailing slashes...

3) Colon Notation
at "Macintosh HD:Users:smerth:Documents"

*)

(*
to make the path generic (not specific to a user's name) you can write:

at (path to documents folder)

This works for: documents, downloads, desktop, applications
*)
