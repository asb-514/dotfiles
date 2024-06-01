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
hs.hotkey.bind ({'alt'}, 'c', 
function () hs.application.launchOrFocus("Google Chrome")  end)


hs.loadSpoon("SpoonInstall")


spoon.SpoonInstall.repos.PaperWM = {
	url = "https://github.com/mogenson/PaperWM.spoon",
	desc = "PaperWM.spoon repository",
	branch = "release",
}

spoon.SpoonInstall:andUse("PaperWM", {
	repo = "PaperWM",
	config = { screen_margin = 16, window_gap = 1 },
	start = true,

})

PaperWM = hs.loadSpoon("PaperWM")
PaperWM:bindHotkeys({
	-- switch to a new focused window in tiled grid
	focus_left  = {{"alt", "cmd"}, "left"},
	focus_right = {{"alt", "cmd"}, "right"},
	focus_up    = {{"alt", "cmd"}, "up"},
	focus_down  = {{"alt", "cmd"}, "down"},

	-- move windows around in tiled grid
	swap_left  = {{"alt", "cmd", "shift"}, "left"},
	swap_right = {{"alt", "cmd", "shift"}, "right"},
	swap_up    = {{"alt", "cmd", "shift"}, "up"},
	swap_down  = {{"alt", "cmd", "shift"}, "down"},

	-- position and resize focused window
	center_window        = {{"alt", "cmd"}, "c"},
	full_width           = {{"alt", "cmd"}, "f"},
	cycle_width          = {{"alt", "cmd"}, "r"},
	reverse_cycle_width  = {{"ctrl", "alt", "cmd"}, "r"},
	cycle_height         = {{"alt", "cmd", "shift"}, "r"},
	reverse_cycle_height = {{"ctrl", "alt", "cmd", "shift"}, "r"},

	-- move focused window into / out of a column
	--slurp_in = {{"alt", "cmd"}, "i"},
	--barf_out = {{"alt", "cmd"}, "o"},

	-- switch to a new Mission Control space
	--switch_space_l = {{"alt", "cmd"}, ","},
	--switch_space_r = {{"alt", "cmd"}, "."},
	--switch_space_1 = {{"alt", "cmd"}, "1"},
	--switch_space_2 = {{"alt", "cmd"}, "2"},
	--switch_space_3 = {{"alt", "cmd"}, "3"},
	--switch_space_4 = {{"alt", "cmd"}, "4"},
	--switch_space_5 = {{"alt", "cmd"}, "5"},
	--switch_space_6 = {{"alt", "cmd"}, "6"},
	--switch_space_7 = {{"alt", "cmd"}, "7"},
	--switch_space_8 = {{"alt", "cmd"}, "8"},
	--switch_space_9 = {{"alt", "cmd"}, "9"},

	-- move focused window to a new space and tile
	move_window_1 = {{"alt", "cmd", "shift"}, "1"},
	move_window_2 = {{"alt", "cmd", "shift"}, "2"},
	move_window_3 = {{"alt", "cmd", "shift"}, "3"},
	move_window_4 = {{"alt", "cmd", "shift"}, "4"},
	move_window_5 = {{"alt", "cmd", "shift"}, "5"},
	move_window_6 = {{"alt", "cmd", "shift"}, "6"},
	move_window_7 = {{"alt", "cmd", "shift"}, "7"},
	move_window_8 = {{"alt", "cmd", "shift"}, "8"},
	move_window_9 = {{"alt", "cmd", "shift"}, "9"}
})

hs.hotkey.bind({"ctrl","alt", "cmd"}, "h", PaperWM.actions.focus_left)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "j", PaperWM.actions.focus_down)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "k", PaperWM.actions.focus_up)
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "l", PaperWM.actions.focus_right)

hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "h", PaperWM.actions.swap_left)
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "j", PaperWM.actions.swap_down)
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "k", PaperWM.actions.swap_up)
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "l", PaperWM.actions.swap_right)

PaperWM.window_filter:rejectApp("iStat Menus Status")
PaperWM.window_filter:rejectApp("Finder")

PaperWM:start()


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

