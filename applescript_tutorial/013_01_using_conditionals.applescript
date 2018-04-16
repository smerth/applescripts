

-- Using conditionals (checking the value of something against something else)

set var1 to "Hello"
set var2 to var1 = "Hello"

-- ie evaluate (var1 = "Hello") and set that var2 to that value
-- you shoud be used to == to test equality (as in C) but AppleScript breaks this convension becuase it is a natural language pardigm.  So the following are also valid

set var2 to var1 is equal to "Hello"

set var1 to 3 > 1
set var1 to 3 > 1
set var1 to 3 ³ 1
set var1 to 3 ² 1

-- you may be used to != for not equal.  AppleScript used the not equal character opt + =

set var1 to 3 ­ 1

-- you can use natural language operators

set var1 to 3 is greater than 1
set var1 to 3 is less than 1

-- see operators table in docs

