-- Majority of script from http://www.svenbit.com/2011/02/create-a-new-wireless-network-ad-hoc-on-mac-os-using-an-applescript/
-- With a little added logic to have the computer join the network if it already exists.

property NetworkName : "Whatever"
property NetworkPassword : "thirteenchara"
property BringupScript : ""
tell application "System Events"
	tell process "SystemUIServer"
		tell menu bar 1
			
			-- Give the computer a little time to startup
			delay 30
			
			-- Find WiFi Menu
			set menu_extras to value of attribute "AXDescription" of menu bar items
			repeat with the_menu from 1 to the count of menu_extras
				if item the_menu of menu_extras contains "Wi-Fi" then exit repeat
			end repeat
			
			
			-- Turn on WiFi and create or join network
			tell menu bar item the_menu
				
				perform action "AXPress"
				
				-- Give the WiFi time to see what's out there.
				delay 10
				
				-- If the network already exists then join.
				if title of menu items of menu 1 contains NetworkName then
					
					say "Joining " & NetworkName
					perform action "AXPress" of menu item NetworkName of menu 1
					
					say "Media Server Ready"
					error number -128
				end if
				
				-- If Wi-Fi is off, turn it on
				if title of menu item 2 of menu 1 is "Turn Wi-Fi On" then
					perform action "AXPress" of menu item "Turn Wi-Fi On" of menu 1
					perform action "AXPress"
				end if
				
				perform action "AXPress" of menu item "Create Network…" of menu 1
			end tell
		end tell
		
		-- Enter information into Create Network Dialog
		tell window 1
			
			-- Change the WiFi Channel to something other than the default (6 in this case) to avoid conflicts
			click pop up button 1
			click menu item 6 of menu 1 of pop up button 1
			
			-- Set a password on the network. I didn't need it.
			--click pop up button 2
			--click menu item 4 of menu 1 of pop up button 2
			--set value of text field 3 to NetworkPassword
			--set value of text field 2 to NetworkPassword
			set value of text field 1 to NetworkName
			click button "Create"
		end tell
	end tell
end tell