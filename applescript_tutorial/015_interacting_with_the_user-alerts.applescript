-- This App adds watermark information to images

-- Interacting with users
-- Under commands in the language guide you can find out about dialogs (the most common of which is alert)
display alert "It's an alert!" message "This is an alert for you." as critical buttons {"Yes", "No", "Maybe"} default button "Yes" cancel button "No" giving up after 15

if button returned of result is "Yes" then
	display alert "You clicked Yes!" message "Good for you"
end if

-- these alerts and button are useful to get user input and control program flow
-- You can also get text input using the display dialog command

display dialog "Fill in the blank" default answer "Bingo Bonanza" with title "My Dialog" with icon note buttons {"Let's go", "No go", "Skip to ma loo"} default button 1

set textResponse to text returned of result
