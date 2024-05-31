macbook_monitor = "Built-in Retina Display"
hyper = {'cmd', 'control'}
hyperShift = {'control', 'cmd', 'shift'}
local reading_layout= {
  {"Codeforces",         nil, macbook_monitor, hs.layout.maximized, nil, nil},
  {"Terminal",        nil, macbook_monitor,    hs.layout.right50,    nil, nil},
}

local planning = {
  {"Reminders",         nil, macbook_monitor, hs.layout.left50, nil, nil},
  {"Calendar",        nil, macbook_monitor,    hs.layout.right50,    nil, nil},
}
hs.hotkey.bind(hyper, '1', function()
  hs.application.launchOrFocus('Codeforces')
  hs.application.launchOrFocus('WezTerm')

  hs.layout.apply(reading_layout)
end)

hs.hotkey.bind(hyper, '2', function()
  hs.application.launchOrFocus('Reminders')
  hs.application.launchOrFocus('Calendar')
  hs.application.launchOrFocus('Reminders')

  hs.layout.apply(planning)
end)
local wm = require('window-management')
-- Window Management
hs.hotkey.bind(hyper,"k", function()
  wm.windowMaximize(0)
end)
hs.hotkey.bind(hyper,"l", function()
  wm.moveWindowToPosition(wm.screenPositions.right)
end)
hs.hotkey.bind(hyperShift,"l", function()
  wm.moveWindowToPosition(wm.screenPositions.right66)
end)
hs.hotkey.bind(hyper,"h", function()
  wm.moveWindowToPosition(wm.screenPositions.left)
end)
hs.hotkey.bind(hyperShift,"h", function()
  wm.moveWindowToPosition(wm.screenPositions.left66)
end)
hs.hotkey.bind(hyper, "r", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind ({'alt'}, 't', 
              function () hs.application.launchOrFocus("WezTerm")  end)
hs.hotkey.bind ({'alt'}, 's', 
              function () hs.application.launchOrFocus("Safari")  end)
hs.hotkey.bind ({'alt'}, 'a', 
              function () hs.application.launchOrFocus("Activity Monitor")  end)
hs.hotkey.bind ({'alt'}, 'e', 
              function () hs.application.launchOrFocus("Emacs")  end)
hs.hotkey.bind ({'alt'}, 'i', 
              function () hs.application.launchOrFocus("Moodle")  end)
hs.hotkey.bind ({'alt'}, 'm', 
              function () hs.application.launchOrFocus("Music")  end)

hs.loadSpoon("SpoonInstall")


spoon.SpoonInstall.repos.PaperWM = {
    url = "https://github.com/mogenson/PaperWM.spoon",
    desc = "PaperWM.spoon repository",
    branch = "release",
}

--spoon.SpoonInstall:andUse("PaperWM", {
	--    repo = "PaperWM",
	--    config = { screen_margin = 16, window_gap = 2 },
	--    start = true,
--	
--})

--PaperWM = hs.loadSpoon("PaperWM")
--PaperWM:bindHotkeys(PaperWM.default_hotkeys)
--
--hs.hotkey.bind({"ctrl","alt", "cmd"}, "h", PaperWM.actions.focus_left)
--hs.hotkey.bind({"ctrl", "alt", "cmd"}, "j", PaperWM.actions.focus_down)
--hs.hotkey.bind({"ctrl", "alt", "cmd"}, "k", PaperWM.actions.focus_up)
--hs.hotkey.bind({"ctrl", "alt", "cmd"}, "l", PaperWM.actions.focus_right)
--
--hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "h", PaperWM.actions.swap_left)
--hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "j", PaperWM.actions.swap_down)
--hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "k", PaperWM.actions.swap_up)
--hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "l", PaperWM.actions.swap_right)
--
--PaperWM.window_filter:rejectApp("iStat Menus Status")
--PaperWM.window_filter:rejectApp("Finder")
--
--PaperWM:start()


spoon.SpoonInstall:andUse("TextClipboardHistory",
               {
                 disable = false,
                 config = {
                   show_in_menubar = false,
                 },
                 hotkeys = {
                   toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true,
               }

)



spoon.SpoonInstall:andUse("KSheet",
               {
                 hotkeys = {
                   toggle = { hyper, "/" }
}})
