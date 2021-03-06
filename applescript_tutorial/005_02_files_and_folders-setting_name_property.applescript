-- create and add a property for the filename
-- look up properties you want to add using the dictionary
-- curly braces hold a list of key value pairs for properties

tell application "Finder"
	make new folder with properties {name:"My_folder"}
end tell

(*

A folder inherits from a container which inherits from an item class so the following properties can be set: 

item n : An item

elements

contained by application, containers, disks, folders, desktop-objects, trash-objects.

properties

name (text) : the name of the item
displayed name (text, r/o) : the user-visible name of the item
name extension (text) : the name extension of the item (such as “txt”)
extension hidden (boolean) : Is the item's extension hidden from the user?
index (integer, r/o) : the index in the front-to-back ordering within its container
container (specifier, r/o) : the container of the item
disk (specifier, r/o) : the disk on which the item is stored
position (point) : the position of the item within its parent window (can only be set for an item in a window viewed as icons or buttons)
desktop position (point) : the position of the item on the desktop
bounds (rectangle) : the bounding rectangle of the item (can only be set for an item in a window viewed as icons or buttons)
label index (integer) : the label of the item
locked (boolean) : Is the file locked?
kind (text, r/o) : the kind of the item
description (text, r/o) : a description of the item
comment (text) : the comment of the item, displayed in the “Get Info” window
size (double integer, r/o) : the logical size of the item
physical size (double integer, r/o) : the actual space used by the item on disk
creation date (date, r/o) : the date on which the item was created
modification date (date) : the date on which the item was last modified
icon (icon family) : the icon bitmap of the item
URL (text, r/o) : the URL of the item
owner (text) : the user that owns the container
group (text) : the user or group that has special access to the container
owner privileges (read only/‌read write/‌write only/‌none)
group privileges (read only/‌read write/‌write only/‌none)
everyones privileges (read only/‌read write/‌write only/‌none)
information window (specifier, r/o) : the information window for the item
properties (record) : every property of an item
class (type, r/o) : the class of the item

*)