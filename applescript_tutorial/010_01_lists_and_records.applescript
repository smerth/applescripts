-- Using lists and records

-- explicitly define a list

set myList to {"apple", 4, "blue" & "berries", 20}

-- to retreive an item from this array just ask for it

set myVal to item 3 of myList

-- note AppleScript arrays are NOT zero indexed

-- using natural language to count items in the list
set howMany to the number of items in myList

-- using natural language to list a range of items from the list
set rangeOfItems to items 2 through 4 of myList

-- change an item in the lisst using the item index
-- set item 3 of myList to "orange"

-- you can add lists together using the &
set newList to myList & {40, "bananas"}


"My list containts: " & myList & myVal & howMany & rangeOfItems
