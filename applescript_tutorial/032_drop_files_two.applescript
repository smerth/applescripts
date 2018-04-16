-- save as application and drop files onto it

on open theFiles
	repeat with theFile in theFiles
		display alert (theFile as string)
	end repeat
end open