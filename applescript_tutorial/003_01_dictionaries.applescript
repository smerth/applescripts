(*

Dictionaries are places where AppleScript can look up what other apps say they'll let AppleScript do. 


The Dictionary window is split into a column view on the top and a detail window at the bottom. On the left of the column view is the listing of Suites within the dictionary. You can think of these Suites like chapters in a book, organizing the different classes and commands together. 

The little orange square S icons next to each one tells you that they're a Suite, 



the little blue C icon stands for Command. 




a purple C icon for item. a class or a type of thing, 


of course, things have properties, as indicated by the square purple P icon in the third column over here. Each of these properties is a value that you can read or set. 

The properties that are Read-Only are indicated with this r/o signifier. The other text here is the type of data that the property expects if you can set it, or the type that it returns if it's Read-Only.


moving down the Suites, you can see there are other groupings of things, for example, Containers and Folders. These are more specific types of items, and, as you can see here in the description window, Container, Computer Object, Desk, and so on inherent from the item class that we took a look at a little bit ago. Some of them through the Container class. 

If you're not familiar with it, inheritance is a term in Object Oriented Programming that means an object has all the properties of something else. Another class called the Super Class. For example this Disk Class here has all of the properties of item.

Since it inherits from it through the Container Class. I'll switch back over to the editor, and we'll use a property from the Item Class. I'll change this line to set var1 to the name of Startup Disk. Startup disk is a placeholder that Finder keeps track of that contains the name of the disk where the Operating System booted from. So this is an item of, Type Disk instead of a Type Container. But since it inherits from Item I still have a name property, Macintosh HD. But since this is a Disk, not just an Item, it also has other properties like Capacity and Free Space, things that makes sense for Disks, but not for all Finder items like Files and Folders.


So I'll change name to Capacity. And I'll hit Run. And down here you can see this is how Apple Script represents a one terabyte disk. 9.99 e+11. I'll jump back into the dictionary. 


Finally these orange square E icons represent elements or things that can be contained within a Container. For example a Container can contain Files. 

So let me switch back to the Editor here and I'll change set var1 to every file of Startup Disc. I'll Run this and I get an empty list back.

What's going on there? First switch over to Finder and go to the Macintosh HD, you can see in fact there are no files showing here. 


But if I switch every File to every Folder and hit Run again, now I get something more like what I expect. I see five folders here and then I see five definitions of what those folders are down here. This is pretty verbose and this is the way that AppleScript thinks about things. 


*)