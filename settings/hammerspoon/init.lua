hs.loadSpoon("Emojis")

spoon.Emojis:bindHotkeys({
  toggle = {{"ctrl"}, "I"}
})

-- type out clipboard contents
hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- toggle dark mode
hs.hotkey.bind({"cmd", "alt", "shift"}, "D", function()
  hs.osascript.applescript('tell app "System Events" to tell appearance preferences to set dark mode to not dark mode')
  -- hs.osascript.applescript('tell app "System Events" to tell appearance preferences to set dark mode to auto')
end)

-- turn off & lock screen
hs.hotkey.bind({"ctrl", "shift"}, "F12", function() hs.caffeinate.systemSleep() end)
