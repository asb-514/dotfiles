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
hs.hotkey.bind(hyperShift, '1', function()
  hs.application.launchOrFocus('Codeforces')
  hs.application.launchOrFocus('Terminal')
  hs.application.launchOrFocus('Terminal')

  hs.layout.apply(reading_layout)
end)

hs.hotkey.bind(hyperShift, '2', function()
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
hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

