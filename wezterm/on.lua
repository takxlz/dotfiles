local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("toggle-opacity", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.6
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("toggle-blur", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if not overrides.macos_window_background_blur then
		overrides.macos_window_background_blur = 0
	else
		overrides.macos_window_background_blur = nil
	end
	window:set_config_overrides(overrides)
end)

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local cwd = pane.current_working_dir
	local dir = ""
	if cwd then
		local path = cwd.file_path or tostring(cwd)
		dir = path:match("([^/]+)/?$") or path
	end
	local index = tostring(tab.tab_index + 1)
	return " " .. index .. ": " .. dir .. " "
end)

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	local w = window:gui_window()
	w:maximize()
end)
