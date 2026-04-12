local wezterm = require("wezterm")
local act = wezterm.action

-- ---------------------------------------------------------------
-- --- wezterm keymap (tmux-style: leader = C-Space)
-- ---------------------------------------------------------------
-- | 操作                   | WezTerm          | 方式       |
-- |------------------------|------------------|------------|
-- | prefix                 | C-Space          | leader     |
-- | 縦分割                 | leader + v       | leader     |
-- | 横分割                 | leader + s       | leader     |
-- | ペイン移動             | Alt + hjkl       | Alt        |
-- | ペインリサイズ         | Alt + C-hjkl     | Alt + Ctrl |
-- | ペイン閉じる           | leader + x       | leader     |
-- | ペインズーム           | leader + z       | leader     |
-- | 新規タブ               | leader + t       | leader     |
-- | タブ閉じる             | leader + c       | leader     |
-- | 次/前のタブ            | Alt + n/p        | Alt        |
-- |                        | C-Tab/C-S-Tab    | （デフォルト）
-- | タブ番号指定           | leader + 1-9     | leader     |
-- | タブ位置移動           | leader + ( / )   | leader     |
-- | フルスクリーン         | leader + f       | leader     |
-- | クイックセレクト       | leader + Space   | leader     |
-- | 背景ブラー切替         | leader + b       | leader     |
-- | ワークスペース一覧     | leader + w       | leader     |
-- | ワークスペース作成     | leader + S       | leader     |
-- | 次/前のワークスペース  | Alt + Cmd + n/p  | Alt + Cmd  |
-- | ワークスペース名変更   | leader + $       | leader     |
-- | 設定リロード           | leader + r       | leader     |
-- | Shift+Enter送信        | Shift + Enter    | —          |
-- ---------------------------------------------------------------
local keys = {
	-- ペイン分割
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- ペイン移動 (Alt: 連続操作用)
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	-- ペインリサイズ (Alt+Ctrl: 連続操作用)
	{ key = "h", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "ALT|CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- ペイン閉じる
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- ペインズーム
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- タブ操作
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "c", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	-- タブ切替 (Alt: 連続操作用)
	{ key = "n", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "ALT", action = act.ActivateTabRelative(-1) },

	-- タブの移動
	{ key = "(", mods = "LEADER", action = act.MoveTabRelative(-1) },
	{ key = ")", mods = "LEADER", action = act.MoveTabRelative(1) },

	-- フルスクリーン
	{ key = "f", mods = "LEADER", action = act.ToggleFullScreen },

	-- クイックセレクト
	{ key = "Space", mods = "LEADER", action = act.QuickSelect },

	-- 背景ブラー切り替え
	{ key = "b", mods = "LEADER", action = act.EmitEvent("toggle-blur") },

	-- ワークスペース [[
	-- ワークスペース切替 (Alt+Cmd: 連続操作用)
	{ key = "n", mods = "ALT|SUPER", action = act.SwitchWorkspaceRelative(1) },
	{ key = "p", mods = "ALT|SUPER", action = act.SwitchWorkspaceRelative(-1) },
	{
		-- ワークスペース新規作成
		key = "S",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "(wezterm) Create new workspace:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		-- ワークスペース名変更
		key = "$",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "(wezterm) Set workspace title:",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},
	{
		-- ワークスペース一覧・選択
		key = "w",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			local workspaces = {}
			for i, name in ipairs(wezterm.mux.get_workspace_names()) do
				table.insert(workspaces, {
					id = name,
					label = string.format("%d. %s", i, name),
				})
			end
			win:perform_action(
				act.InputSelector({
					action = wezterm.action_callback(function(_, _, id, label)
						if not id and not label then
							wezterm.log_info("Workspace selection canceled")
						else
							win:perform_action(act.SwitchToWorkspace({ name = id }), pane)
						end
					end),
					title = "Select workspace",
					choices = workspaces,
					fuzzy = true,
				}),
				pane
			)
		end),
	},
	-- ]]

	-- 設定リロード
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },

	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

-- タブ番号で直接切り替え (leader + 1-9)
for i = 1, 9 do
	table.insert(keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

return keys
