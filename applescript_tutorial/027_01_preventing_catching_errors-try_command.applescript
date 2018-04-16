display dialog "Dialog One"

try
	-- Here's the code that might display an error (in this case just a simple typo)
	disply
on error errorText
	display notification "Oops!: " & errorText
end try

display dialog "Dialog Two"
display dialog "Dialog Three"