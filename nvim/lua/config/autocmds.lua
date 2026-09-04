local autocmd = vim.api.nvim_create_autocmd

-- ヤンク時にハイライト
autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ファイルを開いたとき最後のカーソル位置に戻る
autocmd("BufReadPost", {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- リサイズ時にウィンドウサイズを均等にする
autocmd("VimResized", {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- 外部で書き換えられたファイルをバッファへ自動で読み直す。
-- autoread は Neovim の既定で有効だが、変更を検査する契機が無いと反映されないため
-- フォーカス復帰・バッファ移動・カーソル静止のタイミングで checktime を呼ぶ。
-- CursorHold は updatetime（既定 4000ms）のアイドル後に発火する。
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    -- コマンドライン入力中と実ファイル以外のバッファでは checktime が失敗する
    if vim.fn.mode() ~= "c" and vim.bo.buftype == "" then
      vim.cmd("checktime")
    end
  end,
})

-- 自動で読み直したことを通知する（黙って中身が変わると気付けないため）
autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("ファイルが外部で変更されたため読み直しました", vim.log.levels.WARN)
  end,
})
