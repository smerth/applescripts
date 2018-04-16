tell application "Safari"
	if not (exists (document 1)) then
		--
		-- Safari is *Not* Opened, Call Open New Window Function, Go To Preferred Page
		-- and Activate Safari to Enable Scripting
		--
		tell application "Safari" to activate
		my open_new_window()
		--
		-- Set Safari Location to Preferred Page
		--
		set the URL of document 1 to "http://localhost:8080"
	else
		--
		-- Safari is Opened, Bring it To Front and Open New Tab w/Preferred Page
		--
		if (exists (URL of document 1)) then
			my open_new_tab()
		end if
		--
		-- and Activate Safari to Enable Scripting
		--
		tell application "Safari" to activate
		--
		-- Set Safari Location to Preferred Page
		--
		set the URL of document 1 to "http://localhost:8080"
	end if
end tell

--
-- Open New Window Function
--
on open_new_window()
	tell application "Safari" to activate
	tell application "System Events"
		tell process "Safari"
			click menu item "New Window" of menu "File" of menu bar 1
		end tell
	end tell
end open_new_window

--
-- Open New Tab Function
--
on open_new_tab()
	tell application "Safari" to activate
	tell application "System Events"
		tell process "Safari"
			click menu item "New Tab" of menu "File" of menu bar 1
		end tell
	end tell
end open_new_tab