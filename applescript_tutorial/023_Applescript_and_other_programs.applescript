-- Using AppleScript with other programs

(* 
You can find out whether an app you have supports AppleScript right from inside the editor. If you go to File, Open Dictionary and select one of your applications.

The application has to be running to receive commands, and some apps will open when you open their dictionary. Some apps will open when you call them with a tell command, and others need to be told to activate before they'll open, if they're not already. 

Just like with the built-in dictionaries, you can explore the suites, classes, and properties of the dictionary and get a sense of what you can do programmatically.

If you are going to work with Photoshop download the scripting guide from www.adobe.com/devnet/photoshop/scripting.html it gives a very detailed desciption of classes and commands

*)

-- in general
tell application "Photoshop"
	-- bring the application to the foreground (may not be necessary)
	activate
	-- make a new photoshop doc and set the value of myDoc to it.
	set myDoc to make new document
	set myTextLayer to make new art layer in myDoc with properties {kind:text layer}
	set properties of text object in myTextLayer to {contents:"I'm some text", size:48, font:"Ariel"}
	
end tell

