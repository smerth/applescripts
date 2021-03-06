(*

Say your interested in the name of a disk and you look up disk.
you see here disk inherits from container which inherits from item
so in addition to the properties of disk (listed below) you can interact 
with properties of container and item


disk n [inh. container > item] : A disk

properties

id (integer, r/o) : the unique id for this disk (unchanged while disk remains connected and Finder remains running)
capacity (double integer, r/o) : the total number of bytes (free or used) on the disk
free space (double integer, r/o) : the number of free bytes left on the disk
ejectable (boolean, r/o) : Can the media be ejected (floppies, CDs, and so on)?
local volume (boolean, r/o) : Is the media a local volume (as opposed to a file server)?
startup (boolean, r/o) : Is this disk the boot disk?
format (Mac OS format/‌Mac OS Extended format/‌UFS format/‌NFS format/‌audio format/‌ProDOS format/‌MSDOS format/‌NTFS format/‌ISO 9660 format/‌High Sierra format/‌QuickTake format/‌Apple Photo format/‌AppleShare format/‌UDF format/‌WebDAV format/‌FTP format/‌Packet written UDF format/‌Xsan format/‌unknown format, r/o) : the filesystem format of this disk
journaling enabled (boolean, r/o) : Does this disk do file system journaling?
ignore privileges (boolean) : Ignore permissions on this disk?

*)

-- Properties inheried from Item
tell application "Finder"
	set var1 to the name of (startup disk)
end tell

tell application "Finder"
	set var2 to the owner of (startup disk)
end tell

"Disk Name = " & var1 & ", Disk Owner = " & var2

-- Properties of Disk itself
tell application "Finder"
	set var3 to the format of (startup disk)
end tell

tell application "Finder"
	set var4 to the free space of (startup disk)
end tell

"Disk Name = " & var1 & ", Disk Owner = " & var2 & " Disk Format = " & var3 & ", Disk Free Space = " & var4
