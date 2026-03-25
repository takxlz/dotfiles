local wezterm = require("wezterm")
local act = wezterm.action

-- ---------------------------------------------------------------
-- --- wezterm keymap (tmux-style: leader = C-Space)
-- ---------------------------------------------------------------
-- | 操作                   | tmux           | WezTerm        |
-- |------------------------|----------------|----------------|
-- | prefix                 | C-Space        | C-Space        |
-- | 縦分割                 | prefix + v     | leader + v     |
-- | 横分割                 | prefix + s     | leader + s     |
-- | ペイン移動             | prefix + hjkl  | leader + hjkl  |
-- | ペインリサイズ         | prefix + <>+-  | leader + <>+-  |
-- |                        |                | Alt + hjkl     | ※連続操作用
-- | ペイン閉じる           | -              | leader + x     |
-- | ペインズーム           | -              | leader + z     |
-- | 新規タブ               | prefix + t     | leader + t     |
-- | タブ閉じる             | prefix + c     | leader + c     |
-- | 次/前のタブ            | prefix + C-n/p | leader + C-n/p |
-- |                        |                | C-Tab/C-S-Tab  | ※連続操作用（デフォルト）
-- | タブ番号指定           | prefix + 1-9   | leader + 1-9   |
-- | タブ位置移動           | -              | leader + ( / ) |
-- | フルスクリーン         | -              | leader + f     |
-- | クイックセレクト       | -              | leader + Space |
-- | 背景ブラー切替         | -              | leader + b     |
-- | ワークスペース一覧     | -              | leader + w     |
-- | ワークスペース作成     | -              | leader + S     |
-- | 次/前のワークスペース  | -              | leader + N / P |
-- | ワークスペース名変更   | prefix + $     | leader + $     |
-- | 設定リロード           | prefix + r     | leader + r     |
-- | Shift+Enter送信        | -              | Shift + Enter  |
-- ---------------------------------------------------------------
local keys = {
	-- ペイン分割
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- ペイン移動 (vim style)
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- ペインリサイズ
	{ key = "<", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = ">", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "+", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "-", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },

	-- ペインリサイズ (Alt: 連続操作用)
	{ key = "h", mods = "ALT", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "ALT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "ALT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "ALT", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- ペイン閉じる
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

	-- ペインズーム
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- タブ操作
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "c", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "n", mods = "LEADER|CTRL", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER|CTRL", action = act.ActivateTabRelative(-1) },

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
	{ key = "N", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
	{ key = "P", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
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
