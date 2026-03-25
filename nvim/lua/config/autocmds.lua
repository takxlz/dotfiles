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