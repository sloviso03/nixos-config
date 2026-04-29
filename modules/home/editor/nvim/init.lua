-- Bootstrap LazyVim
require("config.lazy")

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then
      vim.cmd("startinsert")
    end
  end,
})