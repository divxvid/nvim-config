vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.go"},
    callback = function() vim.lsp.buf.format() end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript", "proto" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})
